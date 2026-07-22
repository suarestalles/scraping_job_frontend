/// Generic API Response model
class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;
  final dynamic error;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
    this.error,
  });

  factory ApiResponse.success({
    required T data,
    String? message,
    int? statusCode,
  }) {
    return ApiResponse(
      success: true,
      data: data,
      message: message ?? 'Success',
      statusCode: statusCode ?? 200,
      error: null,
    );
  }

  factory ApiResponse.error({
    required String message,
    dynamic error,
    int? statusCode,
  }) {
    return ApiResponse(
      success: false,
      message: message,
      error: error,
      statusCode: statusCode ?? 500,
      data: null,
    );
  }

  @override
  String toString() => 'ApiResponse(success: $success, message: $message, statusCode: $statusCode)';
}
