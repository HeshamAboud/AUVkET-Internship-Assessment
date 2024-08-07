class Failure {
  bool? success;
  String? message;
  int? code;

  Failure({this.success, this.message, this.code,});

  Failure.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['Message'] = this.message;
    data['Code'] = this.code;

    return data;
  }
}
