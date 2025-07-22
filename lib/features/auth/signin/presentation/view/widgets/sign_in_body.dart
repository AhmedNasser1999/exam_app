import 'package:exam_app/features/auth/signin/presentation/view/widgets/sign_in_builder.dart';
import 'package:exam_app/features/auth/signin/presentation/view/widgets/sign_in_listener.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInListener(widget: SignInBuilder());
  }
}
