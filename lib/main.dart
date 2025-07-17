import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/on_generate_route.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(MyApp(signinUsecase: getIt<SigninUsecase>()));
}

class MyApp extends StatelessWidget {
  final SigninUsecase signinUsecase;
  const MyApp({super.key, required this.signinUsecase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: SignInView.routeName,
      // theme: AppTheme.lightTheme,
      // onGenerateRoute: OnGenerateRoute.onGenerateRoute,
      home: BlocProvider(
        create: (_) => SignInCubit(signinUsecase),
        child: SignInView(),
      ),
    );
  }
}
