import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/home_view.dart';
import 'package:exam_app/features/splash/presentation/view/widget/splash_body.dart';
import 'package:exam_app/features/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = RouteName.splashView;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final cubit = getIt<SplashCubit>();
  @override
  void initState() {
    cubit.userToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) async {
          if (state is SplashHasToken) {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          } else if (state is SplashNotHaveToken) {
            Navigator.pushReplacementNamed(context, SignInView.routeName);
          }
        },
        child: const SplashBody(),
      ),
    );
  }
}
