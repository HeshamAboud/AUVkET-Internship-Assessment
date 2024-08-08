import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feture/home_screen/logic/logic/home_repo.dart';
import '../../feture/login/logic/login_repo.dart';
import '../../feture/register/data/logic/register_repo.dart';
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
  getIt.registerFactory<HomeRepository>(() => HomeRepository(getIt()));
  // forget password

}
