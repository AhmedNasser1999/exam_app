import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/forget_password_builder_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/reset_password_body.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/send_email_body.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/verification_email_body.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBuilder extends StatelessWidget {
  const ForgetPasswordBuilder({
    super.key,
    required this.forgetPasswordBuilderModel,
  });
  final ForgetPasswordBuilderModel forgetPasswordBuilderModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomHeader(
                title: TextConstant.passwordLabel,
                backRouteName: SignInView.routeName,
              ),
              const SizedBox(height: 40.0),
              if (state is ForgetPasswordResetPassword)
                ResetPasswordBody(
                  formKey: forgetPasswordBuilderModel.formKey,
                  controller: forgetPasswordBuilderModel.passwordController,
                  confirmController:
                      forgetPasswordBuilderModel.confirmPasswordController,
                  emailController: forgetPasswordBuilderModel.emailController,
                )
              else if (state is ForgetPasswordVerifiedCode)
                VerificationEmailBody(
                  formKey: forgetPasswordBuilderModel.formKey,
                  controller: forgetPasswordBuilderModel.verifiedController,
                  emailController: forgetPasswordBuilderModel.emailController,
                )
              else
                SendEmailBody(
                  formKey: forgetPasswordBuilderModel.formKey,
                  controller: forgetPasswordBuilderModel.emailController,
                ),
            ],
          ),
        );
      },
    );
  }
}
