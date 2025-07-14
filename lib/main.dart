import 'package:exam_app/core/route/on_generate_route.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SplashView.routeName,
      onGenerateRoute: OnGenerateRoute.onGenerateRoute,
    );
  }
}
