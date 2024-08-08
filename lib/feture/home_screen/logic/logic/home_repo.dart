import 'package:dio/dio.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/network/web_services.dart';
import '../../../../core/network_exceptions.dart';


class HomeRepository {
  final AppWebServices webServices;

  HomeRepository(this.webServices);

  GenericCubit<HomeResponseModel> homeGenericCubit =
  GenericCubit<HomeResponseModel>(HomeResponseModel());

  // Future<dynamic> getHomeData() async {
  //   homeGenericCubit.onLoadingState();
  //   try {
  //     final response = await webServices.getHomeData();
  //     print(response["Success"]);
  //     print(response["Success"]);
  //     print(response["Success"]);
  //     if (response["Success"]==true) {
  //       final apiResponse = HomeResponseModel.fromJson(
  //         response,
  //
  //       );
  //       homeGenericCubit.onUpdateData(apiResponse);
  //       // return ApiResult.success(LoginResponseBody.fromJson(response));
  //     } else {
  //       homeGenericCubit
  //           .onErrorState(NetworkExceptions.handleResponse(response: response));
  //       // return ApiResult.failure(NetworkExceptions.getDioException(response));
  //     }
  //   } on DioException catch (dioError) {
  //     print(dioError.response);
  //     homeGenericCubit.onErrorState(NetworkExceptions.getDioException(dioError));
  //   } catch (error) {
  //     print("error");
  //    // homeGenericCubit.onErrorState(NetworkExceptions.handleResponse(response: error));
  //     // return ApiResult.failure(NetworkExceptions.getDioException(error));
  //   }
  // }
  Future<dynamic> getHomeData() async {
    homeGenericCubit.onLoadingState();
    final response = await webServices.getHomeData();
    print("Full Response: $response");  // Print the entire response

    if (response.containsKey("status")) {
      print("Status: ${response["status"]}");
      print("Response Body: ${response["Product"]}");

      if (response["status"] == "success") {
        final apiResponse = HomeResponseModel.fromJson(response);
        homeGenericCubit.onUpdateData(apiResponse);
      } else {
        homeGenericCubit.onErrorState(
            NetworkExceptions.handleResponse(response: response)
        );
      }
    } else {
      print("Invalid Response Structure");
      homeGenericCubit.onErrorState(NetworkExceptions.handleResponse(response: response));
    }
    // try {
    //   final response = await webServices.getHomeData();
    //   print("Full Response: $response");  // Print the entire response
    //
    //   if (response.containsKey("status")) {
    //     print("Status: ${response["status"]}");
    //     print("Response Body: ${response["Product"]}");
    //
    //     if (response["status"] == "success") {
    //       final apiResponse = HomeResponseModel.fromJson(response);
    //       homeGenericCubit.onUpdateData(apiResponse);
    //     } else {
    //       homeGenericCubit.onErrorState(
    //           NetworkExceptions.handleResponse(response: response)
    //       );
    //     }
    //   } else {
    //     print("Invalid Response Structure");
    //     homeGenericCubit.onErrorState(NetworkExceptions.handleResponse(response: response));
    //   }
    // } on DioException catch (dioError) {
    //   print("DioException: ${dioError.response}");
    //   homeGenericCubit.onErrorState(NetworkExceptions.getDioException(dioError));
    // } catch (error) {
    //   print("Unknown Error: $error");
    //   homeGenericCubit.onErrorState(NetworkExceptions.handleResponse(response: error));
    // }
  }


  // Future<dynamic> homeReel() async {
  //   homeRepository.onLoadingState();
  //   try {
  //     final response = await webServices.home();
  //     print(response["Success"]);
  //     if (response["Success"] == true) {
  //       final apiResponse = ApiResponseModel<HomeModel>.fromJson(
  //         response,
  //             (data) => HomeModel.fromJson(data),
  //       );
  //       homeRepository.onUpdateData(apiResponse);
  //     } else {
  //       homeRepository
  //           .onErrorState(NetworkExceptions.handleResponse(response: response));
  //     }
  //   } on DioException catch (dioError) {
  //     print(dioError.response);
  //     homeRepository
  //         .onErrorState(NetworkExceptions.getDioException(dioError));
  //   } catch (error) {
  //     print("error");
  //     homeRepository
  //         .onErrorState(NetworkExceptions.handleResponse(response: error));
  //   }
  // }}
  // Future<dynamic> getHomeData() async {
  //   homeGenericCubit.onLoadingState();
  //   try {
  //     final response = await webServices.getHomeData();
  //     print(response["status"]);
  //     print(response["Response"]);
  //     if (response["status"] == "success") {
  //       final apiResponse = HomeResponseModel.fromJson(
  //         response,
  //       );
  //       homeGenericCubit.onUpdateData(apiResponse);
  //     } else {
  //       homeGenericCubit
  //           .onErrorState(NetworkExceptions.handleResponse(response: response));
  //     }
  //   } on DioException catch (dioError) {
  //     print(dioError.response);
  //     homeGenericCubit
  //         .onErrorState(NetworkExceptions.getDioException(dioError));
  //   } catch (error) {
  //     print("error");
  //     // homeGenericCubit
  //     //     .onErrorState(NetworkExceptions.handleResponse(response: error));
  //   }
  // }
}

