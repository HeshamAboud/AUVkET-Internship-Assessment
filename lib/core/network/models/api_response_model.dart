class ApiResponseModel<T> {
  final bool? success;
  final String? message;
  final int? code;
  final T? response;

  ApiResponseModel({
    this.success,
    this.message,
    this.code,
    this.response,
  });

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) create) {
    return ApiResponseModel(
      success: json['Success'] as bool,
      message: json['Message'] as String,
      code: json['Code'] as int,
      response: json['Response'] != null ? create(json['Response']) : null,
    );
  }
}
