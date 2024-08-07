import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../helpers/cache_helper.dart';
class AppInterceptor extends Interceptor {
  final Dio dio;
  final String token;

  AppInterceptor({required this.dio, required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // options.headers[]
    CacheHelper.getdata(key: 'token')!=null?  options.headers['Authorization'] = 'Bearer ${CacheHelper.getdata(key: 'token')}':null;
    options.headers['langkey'] = 'en';
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    print("onRequest method");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {

    }

    super.onError(err, handler);
  }
}
