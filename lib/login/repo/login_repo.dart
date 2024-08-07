import 'package:dio/dio.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/network/web_services.dart';
import '../../../core/network_exceptions.dart';
import '../../core/models/login_request_body.dart';
import '../login_response.dart';

class LoginRepository {
  final AppWebServices webServices;

  LoginRepository(this.webServices);

  GenericCubit<LoginResponse> loginGenericCubit =
  GenericCubit<LoginResponse>(LoginResponse());

  Future<dynamic> login({required Map<String,dynamic> loginBody}) async {
    loginGenericCubit.onLoadingState();
    try {
      final response = await webServices.login(loginBody);
      print(response["status"]);
      if (response["status"] == "success") {
        final apiResponse = LoginResponse.fromJson(
          response,

        );
        loginGenericCubit.onUpdateData(apiResponse);
        // return ApiResult.success(LoginResponseBody.fromJson(response));
      } else {
        loginGenericCubit
            .onErrorState(NetworkExceptions.handleResponse(response: response));
        // return ApiResult.failure(NetworkExceptions.getDioException(response));
      }
    } on DioException catch (dioError) {
      print(dioError.response);
      loginGenericCubit.onErrorState(NetworkExceptions.getDioException(dioError));
    } catch (error) {
      print("error");
      // return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}