import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

abstract class OnGenerateRoute {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RouteName.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RouteName.sigInName:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case RouteName.sigUpName:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
