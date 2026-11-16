class NetworkResponse {
  final bool? isSuccess;
  final int statusCode;
  final String? body;
  final String? errorMessage;

  NetworkResponse({
    this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}
