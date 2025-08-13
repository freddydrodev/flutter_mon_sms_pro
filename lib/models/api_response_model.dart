class ApiResponseModel<T> {
  final bool success;
  final String? error;
  final T? data;
  final bool? isZodError;

  ApiResponseModel({
    required this.success,
    this.error,
    this.data,
    this.isZodError = false,
  });

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponseModel(
      success: json['success'] as bool,
      error: json['error'] as String?,
      data: json['data'] != null
          ? fromJsonT != null
              ? fromJsonT(json['data'])
              : json['data'] as T
          : null,
      isZodError: json['isZodError'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'success': success,
      'error': error,
      'data': data != null ? toJsonT(data as T) : null,
      'isZodError': isZodError,
    };
  }
}
