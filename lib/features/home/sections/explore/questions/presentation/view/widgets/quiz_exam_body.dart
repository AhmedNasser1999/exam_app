import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/builder_quizExam_body.dart';

import 'package:flutter/material.dart';

class QuizExamBody extends StatelessWidget {
  const QuizExamBody({super.key, required this.examEntity});
  final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BuilderQuizExamBody(examEntity: examEntity),
      ),
    );
  }
}
