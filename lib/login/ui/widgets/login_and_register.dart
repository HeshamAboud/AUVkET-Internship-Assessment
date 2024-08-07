import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/components.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../core/models/login_request_body.dart';
import '../../../register/ui/screen/Register.dart';
import '../../repo/login_repo.dart';
import 'check_login.dart';

class LoginAndRegister extends StatefulWidget {
  LoginAndRegister({super.key, required this.name, required this.pass});
final String name;
final String pass;
  @override
  State<LoginAndRegister> createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  LoginRepository loginRepository = getIt<LoginRepository>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          onPressed: () {

            print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
            print(widget.name);
            print(widget.name);
            print(widget.pass);
            loginRepository.login(
              loginBody: {
                "email":widget.name,
                "password":widget.pass,
              },

            //     loginInPut: {
            //   "PlayerUser":widget.name,
            //   "PlayerPassword":widget.pass,
            // }
            );
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF1DBF73),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don’t have an account ? ",
                style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child:
                  Text("Register ", style: TextStyle(color: Color(0xFF1DBF73))),
            )
          ],
        ),
        CheckLoginBlocListenerWidget(
          loginRepository: loginRepository,
        ),
      ],
    );
  }
}
