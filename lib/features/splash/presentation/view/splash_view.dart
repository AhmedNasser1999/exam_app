import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/splash/presentation/view/widget/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = RouteName.splashView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashBody(),);
  }
}
