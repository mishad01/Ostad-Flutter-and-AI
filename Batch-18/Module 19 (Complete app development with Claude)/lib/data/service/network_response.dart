/// What [NetworkCaller] hands back after every HTTP request.
///
/// The caller never throws. It always returns one of these, so the code above
/// it can check [isSuccess] instead of wrapping every call in try/catch.
class NetworkResponse {
  const NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });

  /// `true` when the server answered with a 2xx status code.
  final bool isSuccess;

  /// HTTP status code, or `-1` when no response arrived (timeout, no internet).
  final int statusCode;

  /// The raw response body. Still a JSON string; decoding is the service's job.
  final String? body;

  /// A readable reason when [isSuccess] is `false`.
  final String? errorMessage;
}

//After API call
/*
- success/error
- body
- status
 */
