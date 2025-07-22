import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = RouteName.sigInName;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignInBody());
  }
}
