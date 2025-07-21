import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  static const String routeName = RouteName.forgetPassword;

  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ForgetPasswordBody());
  }
}
