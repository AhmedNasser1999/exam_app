import 'package:exam_app/features/auth/signup/presentation/view/widgets/sign_up_builder.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/sign_up_listener.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SignUpListener(child: SignUpBuilder(formKey: formKey));
  }
}
