import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../core/app_strings.dart';
import '../cache/cache_service.dart';
import 'network_log_box.dart';
import 'network_response.dart';
import 'session_expired.dart';

/// The only class in the app that talks to the `http` package.
///
/// It sends a request, prints the request and response to the debug console
/// with `logger`, and turns every outcome (success, bad status, timeout,
/// no internet) into a [NetworkResponse]. It knows nothing about wger,
/// entities or JSON shapes; that belongs to the feature services above it.
class NetworkCaller {
  static const Duration _timeout = Duration(seconds: 50);

  // Logger's default filter prints in debug builds only, so release builds stay silent.
  // No box borders or colors: they render as garbage in some consoles.
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: false,
      printEmojis: false,
      noBoxingByDefault: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );

  /// Sends a GET request to [uri].
  Future<NetworkResponse> get(Uri uri, {Map<String, String>? headers}) async {
    _logger.i(NetworkLogBox.request('GET', uri, headers));
    final stopwatch = Stopwatch()..start();
    try {
      final response = await http.get(uri, headers: headers).timeout(_timeout);
      _logResponse('GET', response, stopwatch.elapsedMilliseconds);
      return _toNetworkResponse(response, headers);
    } catch (e, stackTrace) {
      _logError(
        'GET',
        uri,
        '${AppStrings.networkUnexpectedError} ($e)',
        stopwatch,
      );
      _logger.e('', stackTrace: stackTrace);
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  /// Sends a POST request to [uri] with [body] encoded as JSON.
  Future<NetworkResponse> post(
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final requestHeaders = {'Content-Type': 'application/json', ...?headers};
    final encodedBody = body == null ? null : jsonEncode(body);
    _logger.i(
      NetworkLogBox.request('POST', uri, requestHeaders, body: encodedBody),
    );
    final stopwatch = Stopwatch()..start();
    try {
      final response = await http
          .post(uri, headers: requestHeaders, body: encodedBody)
          .timeout(_timeout);
      _logResponse('POST', response, stopwatch.elapsedMilliseconds);
      return _toNetworkResponse(response, requestHeaders);
    } catch (e, stackTrace) {
      _logError(
        'POST',
        uri,
        '${AppStrings.networkUnexpectedError} ($e)',
        stopwatch,
      );
      _logger.e('', stackTrace: stackTrace);
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  /// Sends a PATCH request to [uri] with [body] encoded as JSON.
  Future<NetworkResponse> patch(
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    return _sendWithBody('PATCH', uri, headers: headers, body: body);
  }

  /// Sends a DELETE request to [uri].
  Future<NetworkResponse> delete(Uri uri, {Map<String, String>? headers}) {
    return _sendWithBody('DELETE', uri, headers: headers);
  }

  Future<NetworkResponse> _sendWithBody(
    String method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final requestHeaders = {'Content-Type': 'application/json', ...?headers};
    final encodedBody = body == null ? null : jsonEncode(body);
    _logger.i(
      NetworkLogBox.request(method, uri, requestHeaders, body: encodedBody),
    );
    final stopwatch = Stopwatch()..start();
    try {
      final request = http.Request(method, uri)
        ..headers.addAll(requestHeaders)
        ..body = encodedBody ?? '';
      final streamed = await request.send().timeout(_timeout);
      final response = await http.Response.fromStream(streamed);
      _logResponse(method, response, stopwatch.elapsedMilliseconds);
      return _toNetworkResponse(response, requestHeaders);
    } catch (e, stackTrace) {
      _logError(
        method,
        uri,
        '${AppStrings.networkUnexpectedError} ($e)',
        stopwatch,
      );
      _logger.e('', stackTrace: stackTrace);
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  void _logResponse(String method, http.Response response, int elapsedMs) {
    final message = NetworkLogBox.response(
      method: method,
      uri: response.request?.url,
      statusCode: response.statusCode,
      reason: response.reasonPhrase,
      elapsedMs: elapsedMs,
      body: response.body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      _logger.d(message);
    } else {
      _logger.e(message);
    }
  }

  void _logError(String method, Uri uri, String message, Stopwatch stopwatch) {
    _logger.w(
      NetworkLogBox.error(method, uri, message, stopwatch.elapsedMilliseconds),
    );
  }

  NetworkResponse _toNetworkResponse(
    http.Response response,
    Map<String, String>? requestHeaders,
  ) {
    final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
    // A 401 on a request that carried a `token` header means the login is
    // missing or expired. Login/OTP calls send no token, so their own
    // "wrong password" 401 does not land here.
    if (response.statusCode == 401 &&
        (requestHeaders?.containsKey('token') ?? false)) {
      CacheService.clearAccessToken();
      SessionExpired.onExpired?.call();
    }

    return NetworkResponse(
      isSuccess: isSuccess,
      statusCode: response.statusCode,
      body: response.body,
      errorMessage: isSuccess
          ? null
          : _serverMessage(response.body) ??
                '${AppStrings.networkServerError} ${response.statusCode}',
    );
  }

  /// The API answers errors as `{"msg": "..."}`; show that text when present.
  String? _serverMessage(String body) {
    try {
      final json = jsonDecode(body);
      final msg = json is Map ? json['msg'] : null;

      return msg is String && msg.isNotEmpty ? msg : null;
    } catch (_) {
      return null;
    }
  }

  NetworkResponse _failure(String message) {
    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: message,
    );
  }
}
