import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../core/app_strings.dart';
import 'network_log_box.dart';
import 'network_response.dart';

/// The only class in the app that talks to the `http` package.
///
/// It sends a request, prints the request and response to the debug console
/// with `logger`, and turns every outcome (success, bad status, timeout,
/// no internet) into a [NetworkResponse]. It knows nothing about wger,
/// entities or JSON shapes; that belongs to the feature services above it.
class NetworkCaller {
  static const Duration _timeout = Duration(seconds: 20);

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
      _logResponse(response, stopwatch.elapsedMilliseconds);
      return _toNetworkResponse(response);
    } on TimeoutException {
      _logError(uri, AppStrings.networkTimeoutError, stopwatch);
      return _failure(AppStrings.networkTimeoutError);
    } on SocketException {
      _logError(uri, AppStrings.networkNoInternetError, stopwatch);
      return _failure(AppStrings.networkNoInternetError);
    } catch (e, stackTrace) {
      _logError(uri, '${AppStrings.networkUnexpectedError} ($e)', stopwatch);
      _logger.e('', stackTrace: stackTrace);
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  void _logResponse(http.Response response, int elapsedMs) {
    final message = NetworkLogBox.response(
      method: 'GET',
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

  void _logError(Uri uri, String message, Stopwatch stopwatch) {
    _logger.w(NetworkLogBox.error('GET', uri, message, stopwatch.elapsedMilliseconds));
  }

  NetworkResponse _toNetworkResponse(http.Response response) {
    final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
    return NetworkResponse(
      isSuccess: isSuccess,
      statusCode: response.statusCode,
      body: response.body,
      errorMessage: isSuccess
          ? null
          : '${AppStrings.networkServerError} ${response.statusCode}',
    );
  }

  NetworkResponse _failure(String message) {
    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: message,
    );
  }
}
