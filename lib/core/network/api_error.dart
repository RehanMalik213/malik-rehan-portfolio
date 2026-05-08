class APIError {
  final String message;
  final int? statusCode;

  const APIError(this.message, {this.statusCode});

  @override
  String toString() => 'APIError(message: $message, statusCode: $statusCode)';
}
