import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/splash/presentation/view/widget/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = RouteName.splashView;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, SignInView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}
