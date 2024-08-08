import 'package:dio/dio.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/network/web_services.dart';
import '../../../../core/network_exceptions.dart';
import '../model/register_response.dart';



class RegisterRepository {
  final AppWebServices webServices;

  RegisterRepository(this.webServices);

  GenericCubit<RegisterResponse> registerGenericCubit =
  GenericCubit<RegisterResponse>(RegisterResponse());

  Future<dynamic> register({required Map<String,dynamic> registerBody}) async {
    registerGenericCubit.onLoadingState();
    try {
      final response = await webServices.register(registerBody);
      print(response["status"]);
      print(response["status"]);
      print(response["status"]);
      print(response["status"]);
      if (response["status"] == "success") {
        final apiResponse = RegisterResponse.fromJson(
          response,

        );
        registerGenericCubit.onUpdateData(apiResponse);
        // return ApiResult.success(LoginResponseBody.fromJson(response));
      } else {
        registerGenericCubit
            .onErrorState(NetworkExceptions.handleResponse(response: response));
        // return ApiResult.failure(NetworkExceptions.getDioException(response));
      }
    } on DioException catch (dioError) {
      print(dioError.response);
      registerGenericCubit.onErrorState(NetworkExceptions.getDioException(dioError));
    } catch (error) {
      print("error");
       //return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}