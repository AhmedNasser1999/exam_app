import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/exam_questions_body.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/exam_start_body.dart';
import 'package:flutter/material.dart';

class ExamBody extends StatelessWidget {
  const ExamBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return const SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Expanded(child: ExamQuestionsBody())],
        ),
      ),
    );
  }
}
