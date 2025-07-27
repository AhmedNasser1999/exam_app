import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/all_exam_body.dart';
import 'package:flutter/material.dart';

class AllExamView extends StatelessWidget {
  const AllExamView({super.key});
  static const String routeName = RouteName.allExamView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AllExamBody());
  }
}
