import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/register/data/model/register_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/components.dart';
import '../../../core/generic_cubit/generic_cubit.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../../core/network_exceptions.dart';
import '../../../simple_e_commerc.dart';
import '../../data/repo/register_repo.dart';
import '../widgets/screen_prograss.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  List<String> listItem = ["Seller", "Buyer", "Both"];
  String selectedValue = "Seller";
  bool click = false;
  RegisterRepository registerRepository = getIt<RegisterRepository>();

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
                const BackWidget(text: "Register"),
                ProgressIndicatorWidget(),
                Row(
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: CustomFormFieldColumn1(
                        text: "first Name",
                        controller: firstNameController,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 180.w,
                      child: CustomFormFieldColumn1(
                        text: "last Name",
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFormFieldColumn1(
                  text: "Email Address",
                  controller: emailController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFormFieldColumn1(
                  text: "Password",
                  controller: passwordController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFormFieldColumn1(
                  text: "Confirm Password",
                  controller: confirmPasswordController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocListener<GenericCubit<RegisterResponse>,
                    GenericCubitState<RegisterResponse>>(
                  bloc: registerRepository.registerGenericCubit,
                  listener: (context, state) {
                    if (state is GenericUpdatedState<RegisterResponse>) {
                      if (state.data.status != null) {
                        if (state.data.message == " Registration successful") {
                          print(state.data.message);
                          print(state.data.user!.token);
                          CacheHelper.saveData(key: "token", value: state.data.user!.token);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SimpleEcommerce()),
                          );
                        } else {
                          showDataAlert(
                              context: context,
                              child: Text(NetworkExceptions.getErrorMessage(
                                  state.responseError!)));
                        }
                      }
                    }
                    if (state is GenericErrorState) {
                      showDataAlert(
                          context: context,
                          child: Text(NetworkExceptions.getErrorMessage(
                              state.responseError!)));
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
                DefaultButton(
                  onPressed: () {
                    registerRepository.register(registerBody: {
                      "email": emailController.text,
                      "firstName": firstNameController.text,
                      "lastName": lastNameController.text,
                      "password": passwordController.text,
                      "confirmPassword": confirmPasswordController.text,
                    });
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
