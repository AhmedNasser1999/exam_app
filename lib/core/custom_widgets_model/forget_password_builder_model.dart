import 'package:flutter/material.dart';

class ForgetPasswordBuilderModel {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;
  final TextEditingController verifiedController;

  ForgetPasswordBuilderModel({
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.emailController,
    required this.verifiedController,
  });
}
