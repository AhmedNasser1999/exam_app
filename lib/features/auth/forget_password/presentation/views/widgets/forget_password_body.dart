import 'package:exam_app/core/custom_widgets_model/forget_password_builder_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/forget_password_builder.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/forget_password_listener.dart';

import 'package:flutter/material.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController verifiedController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    verifiedController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ForgetPasswordListener(
        widget: ForgetPasswordBuilder(
          forgetPasswordBuilderModel: ForgetPasswordBuilderModel(
            confirmPasswordController: confirmPasswordController,
            emailController: emailController,
            formKey: formKey,
            passwordController: passwordController,
            verifiedController: verifiedController,
          ),
        ),
      ),
    );
  }
}
