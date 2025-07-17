import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/sign_up_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<SignupCubit>(),
            child: const SignUpView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
