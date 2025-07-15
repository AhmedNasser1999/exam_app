import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/on_generate_route.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      initialRoute: SplashView.routeName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: OnGenerateRoute.onGenerateRoute,
    );
  }
}
