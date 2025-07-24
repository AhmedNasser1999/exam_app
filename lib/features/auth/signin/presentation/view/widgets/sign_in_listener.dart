import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:exam_app/features/subjects/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInListener extends StatelessWidget {
  const SignInListener({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is SignInSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: "",
                title: TextConstant.successTitle,
              ),
            );
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is SignInFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.failure,
                message: state.error,
                title: TextConstant.failureTitle,
              ),
            );
        }
      },
      child: widget,
    );
  }
}
