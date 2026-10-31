import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/app_strings.dart';
import 'network_response.dart';

/// The only class in the app that talks to the `http` package.
///
/// It sends a request and turns every outcome (success, bad status,
/// timeout, no internet) into a [NetworkResponse]. It knows nothing about wger,
/// entities or JSON shapes; that belongs to the feature services above it.
class NetworkCaller {
  static const Duration _timeout = Duration(seconds: 20);

  /// Sends a GET request to [uri].
  Future<NetworkResponse> get(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers).timeout(_timeout);
      return _toNetworkResponse(response);
    } on TimeoutException {
      return _failure(AppStrings.networkTimeoutError);
    } on SocketException {
      return _failure(AppStrings.networkNoInternetError);
    } catch (_) {
      return _failure(AppStrings.networkUnexpectedError);
    }
  }

  NetworkResponse _toNetworkResponse(http.Response response) {
    final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
    return NetworkResponse(
      isSuccess: isSuccess,
      statusCode: response.statusCode,
      body: response.body,
      errorMessage: isSuccess ? null : '${AppStrings.networkServerError} ${response.statusCode}',
    );
  }

  NetworkResponse _failure(String message) {
    return NetworkResponse(isSuccess: false, statusCode: -1, errorMessage: message);
  }
}
