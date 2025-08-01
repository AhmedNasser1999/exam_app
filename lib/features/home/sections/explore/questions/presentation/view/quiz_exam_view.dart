import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/quiz_exam_body.dart';
import 'package:flutter/material.dart';

class QuizExamView extends StatefulWidget {
  const QuizExamView({super.key, required this.examInfoEntity});
  static const String routeName = RouteName.quizExamView;
  final ExamEntity examInfoEntity;

  @override
  State<QuizExamView> createState() => _QuizExamViewState();
}

class _QuizExamViewState extends State<QuizExamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuizExamBody(examEntity: widget.examInfoEntity));
  }
}
