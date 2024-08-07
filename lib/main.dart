import 'package:e_commerce_app/login/ui/screens/login_screen.dart';
import 'package:e_commerce_app/simple_e_commerc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/cache_helper.dart';
import 'core/networks/api_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  ApiManager.init();
  await CacheHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            //home: CacheHelper.getdata(key: "token") !=null ?SimpleEcommerce():  LoginScreen(),
            home:   LoginScreen(),
          );
        }
    );
  }
}

