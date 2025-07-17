import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = RouteName.sigUpName;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignUpBody()));
  }
}
