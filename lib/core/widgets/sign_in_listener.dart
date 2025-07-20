import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:exam_app/features/auth/signin/presentation/view/hello_screen.dart';
import 'package:flutter/material.dart';

class SignInListener {
  static void signInListener(context, state) {
    if (state is SignInLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
    } else if (state is SignInSuccess) {
      Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HelloScreen()),
      );
    } else if (state is SignInFailure) {
      Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
