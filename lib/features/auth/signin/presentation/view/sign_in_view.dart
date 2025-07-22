import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/widgets/sign_in_builder.dart';
import 'package:exam_app/features/auth/signin/presentation/view/widgets/sign_in_listener.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = RouteName.sigInName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) =>
            SignInListener.signInListener(context, state),

        builder: (context, state) {
          final cubit = context.read<SignInCubit>();
          return SignInBuilder(
            emailController: cubit.emailController,
            passwordController: cubit.passwordController,
          );
        },
      ),
    );
  }
}
