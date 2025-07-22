import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/api/store_user_token.dart';
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
  String? isTokenExist;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final storeUserToken = getIt<StoreUserToken>();
    await Future.delayed(const Duration(seconds: 1));

    isTokenExist = await storeUserToken.getToken();

    if (!mounted) return; // Prevent navigation if widget is disposed

    if (isTokenExist == null) {
      Navigator.pushReplacementNamed(context, SignInView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}
