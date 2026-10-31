import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../core/app_strings.dart';
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
  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// Sends a GET request to [uri].
  Future<NetworkResponse> get(Uri uri, {Map<String, String>? headers}) async {
    _logger.i('GET $uri');
    try {
      final response = await http.get(uri, headers: headers).timeout(_timeout);
      _logResponse(response);
      return _toNetworkResponse(response);
    } on TimeoutException {
      _logger.w(AppStrings.networkTimeoutError);
      return _failure(AppStrings.networkTimeoutError);
    } on SocketException {
      _logger.w(AppStrings.networkNoInternetError);
      return _failure(AppStrings.networkNoInternetError);
    } catch (e, stackTrace) {
      _logger.e(
        AppStrings.networkUnexpectedError,
        error: e,
        stackTrace: stackTrace,
      );
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  void _logResponse(http.Response response) {
    final message =
        '${response.statusCode} ${response.request?.url}\n${response.body}';
    if (response.statusCode >= 200 && response.statusCode < 300) {
      _logger.d(message);
    } else {
      _logger.e(message);
    }
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
