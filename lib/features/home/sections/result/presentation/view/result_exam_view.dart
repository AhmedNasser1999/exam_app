import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/widgets/result_exam_body.dart';
import 'package:flutter/material.dart';

class ResultExamView extends StatelessWidget {
  const ResultExamView({super.key, required this.allQuestion});
  static const String routeName = RouteName.resultView;
  final List<QuestionsEntity> allQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ResultExamBody(allQuestion: allQuestion),
        ),
      ),
    );
  }
}
