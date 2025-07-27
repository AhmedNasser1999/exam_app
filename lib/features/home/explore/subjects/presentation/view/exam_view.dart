import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/widgets/exam_body.dart';
import 'package:flutter/material.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});
  static const String routeName = RouteName.examView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ExamBody());
  }
}
