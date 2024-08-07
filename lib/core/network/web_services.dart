import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/base_url.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_request_body.dart';


part 'web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AppWebServices {
  factory AppWebServices(Dio dio, {String baseUrl}) = _AppWebServices;

  @POST(clientLogin)
  Future<dynamic> login(@Body()  Map<String,dynamic> loginBody);

  @POST(register1)
  Future<dynamic> register(@Body()  Map<String,dynamic> registerBody);
  //
  // @POST(clientForgetPassword)
  // Future<dynamic> forgetPassword(
  //     @Body() ForgetPasswordRequestBody forgetPasswordRequestBody);
  //

}
