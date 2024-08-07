import 'package:dio/dio.dart';
import 'package:e_commerce_app/register/data/repo/register_repo.dart';
import 'package:get_it/get_it.dart';


import '../../login/repo/login_repo.dart';
import '../network/dio_factory/dio_factory.dart';
import '../network/web_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<AppWebServices>(() => AppWebServices(dio));

//  login
  getIt.registerFactory<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<RegisterRepository>(() => RegisterRepository(getIt()));
  // forget password

}
