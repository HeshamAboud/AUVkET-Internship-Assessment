import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../core/components/components.dart';
import '../../repo/login_repo.dart';
import '../widgets/login_and_register.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool _isObscure=true;
  LoginRepository loginRepository = getIt<LoginRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BackWidget(
                  text: "Account Login",
                ),
                SizedBox(
                  height: 10.h,
                ),
                SvgPicture.asset("assets/Login-cuate 1.svg"),
            
                CustomFormFieldColumn1(
                  text: "Email Address",
                  controller: emailController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 68.h,
                      child: TextField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ?Icons.visibility_off: Icons.visibility  ,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF9F9F9)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF9F9F9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF9F9F9)),
                          ),
                          filled: true,
                          fillColor:Color(0xFFF9F9F9),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: value,
                      activeColor: Colors.green,
                      onChanged: (bool? value1) {
                        setState(() {
                          value = value1 ?? false;
                        });
                      },
                    ),
                    Spacer(),
                    Text("Forgot Password?",style: TextStyle(color: Colors.grey),),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
            
                LoginAndRegister(name: emailController.text,pass: passwordController.text,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
