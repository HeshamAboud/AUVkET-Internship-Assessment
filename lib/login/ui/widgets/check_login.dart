import 'dart:async';

import 'package:e_commerce_app/simple_e_commerc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/network/models/api_response_model.dart';
import '../../../../core/network_exceptions.dart';

import '../../../core/components/components.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../login_response.dart';
import '../../repo/login_repo.dart';

class CheckLoginBlocListenerWidget extends StatelessWidget {
  const CheckLoginBlocListenerWidget(
      {super.key, required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenericCubit<LoginResponse>,
        GenericCubitState<LoginResponse>>(
      bloc: loginRepository.loginGenericCubit,
      listener: (context, state) {
        if (state is GenericUpdatedState<LoginResponse>) {
          if (state.data.status != null) {
            if (state.data.message == "Login successful") {
              print(state.data.user!.token);
              CacheHelper.saveData(key: "token", value: state.data.user!.token);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleEcommerce()),
              );
              print(state.data.message);
            } else {
              showDataAlert(
                  context: context,
                  child: Text(
                      NetworkExceptions.getErrorMessage(state.responseError!)));
            }
          }
        }
        if (state is GenericErrorState) {
          showDataAlert(
              context: context,
              child: Text(
                  NetworkExceptions.getErrorMessage(state.responseError!)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
