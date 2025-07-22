import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ForgetPasswordFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.failure,
                message: state.errorMessage,
                title: TextConstant.failureTitle,
              ),
            );
        } else if (state is ForgetPasswordVerifiedCode) {
          Navigator.of(context, rootNavigator: true).pop();
        } else if (state is ForgetPasswordResetPassword) {
          Navigator.of(context, rootNavigator: true).pop();
        } else if (state is ResetPasswordSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushReplacementNamed(context, SignInView.routeName);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: "Password Change",
                title: "",
              ),
            );
        }
      },
      child: widget,
    );
  }
}
