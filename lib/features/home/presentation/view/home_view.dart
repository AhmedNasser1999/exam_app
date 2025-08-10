import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = RouteName.homeView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: const HomeViewBody(),
    );
  }
}
