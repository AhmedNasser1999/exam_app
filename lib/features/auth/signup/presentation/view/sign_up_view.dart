import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/sign_up_body.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart'; // If using get_it for DI

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = RouteName.sigUpName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => GetIt.instance<SignupCubit>(), // Use get_it to get SignupCubit
          child: const SignUpBody(),
        ),
      ),
    );
  }
}