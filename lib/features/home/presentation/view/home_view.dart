import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/custom_navigation_bar.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = RouteName.homeView;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
