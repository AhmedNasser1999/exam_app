import 'package:flutter/material.dart';

abstract class SignInEvent {}

class SignInSuccessEvent extends SignInEvent {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInSuccessEvent({
    required this.emailController,
    required this.passwordController,
  });
}

class SignInRememberMeEvent extends SignInEvent {}

class SignInFormValidateEvent extends SignInEvent {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInFormValidateEvent({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
}
