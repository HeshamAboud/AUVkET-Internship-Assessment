import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'password')
  String? password;

  LoginRequestBody({
    this.userName,
    this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
