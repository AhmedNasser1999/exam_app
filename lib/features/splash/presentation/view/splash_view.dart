import 'package:exam_app/core/local_data/user_cash_token.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
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
    checkToken();
    super.initState();
  }

  Future<void> checkToken() async {
    final hasToken = await UserCashToken.hasToken();
    await Future.delayed(const Duration(seconds: 3));
    if (hasToken) {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, SignInView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}
