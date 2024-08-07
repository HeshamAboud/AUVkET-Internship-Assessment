import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networks/request_body.dart';
import '../base_url.dart';
import 'api_response.dart';


class ApiManager {
  static final Dio _dio = Dio();
  static const bool _isTestMode = true;

  static void init() {
    //  default configs
    _dio.options.baseUrl = ApiManager.getBaseUrl();
    _dio.options.connectTimeout = const Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    _dio.options.responseType = ResponseType.plain;
    _dio.options.followRedirects = false;
    if (_isTestMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false));
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          return handler.next(e);
        },
      ),
    );
  }

  static Future<ApiResponse> sendRequest({
    required String link,
    RequestBody? body,
    Map<String, dynamic>? queryParams,
    FormData? formData,
    Method method = Method.POST,
  }) async {
    Map<String, dynamic> headers = {};

    headers.putIfAbsent("langkey", () => "en");
    headers.putIfAbsent("Accept", () => "application/json");

    if (formData != null) {
      headers.putIfAbsent("Content-Type", () => "multipart/form-data; boundary=${formData.boundary}");
    }

    try {
      Response response;
      if (method == Method.POST) {
        response = await _dio.post(link,
            data: formData ?? body?.getBody(),
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else if (method == Method.PUT) {
        response = await _dio.put(link,
            data: formData ?? body?.getBody(),
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else if (method == Method.GET) {
        response = await _dio.get(link,
            queryParameters: queryParams, options: Options(headers: headers));
      } else if (method == Method.DELETE) {
        response = await _dio.delete(link,
            data: body,
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else if (method == Method.PATCH) {
        response = await _dio.patch(link,
            data: formData ?? body?.getBody(),
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else {
        throw UnsupportedError("HTTP method not supported");
      }

      return ApiResponse(response.statusCode, jsonDecode(response.data.toString()), "");
    } on DioException catch (e) {
      // Convert DioException to ApiResponse with an error message
      // final failure = ErrorHandler.handle(e).failure;
      return ApiResponse(e.response?.statusCode ?? -1, jsonDecode(e.response!.data), e.message);
    }
  }


  static String getBaseUrl() {
    if (_isTestMode) {
      return baseUrl;
    } else {
      return baseUrl;
    }
  }

  static String buildFileUrl(String filePatUrl) {
    return getBaseUrl() + filePatUrl;
  }

  static getErrorMsg(dynamic data) {
    if (data == null || data == "") {
      return "Error in server";
    }
    var error = "";
    final map = jsonDecode(data);
    map.keys.forEach((key) {
      if (key == "errors") {
        final errors = map['errors'] as Map<String, dynamic>;
        for (var errKey in errors.keys) {
          var exceptions = errors[errKey] as List<dynamic>;
          error += "${exceptions[0]}\n";
        }
      }
    });
    if (error == "") {
      if (map["message"] != null) {
        error = map["message"];
      }
    }
    return error;
  }
}

// ignore: constant_identifier_names
enum Method { POST, PUT, GET, DELETE, PATCH }
