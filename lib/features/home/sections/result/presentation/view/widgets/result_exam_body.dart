import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';

import 'package:exam_app/features/home/sections/result/presentation/view/widgets/list_question_items.dart';
import 'package:flutter/material.dart';

class ResultExamBody extends StatelessWidget {
  const ResultExamBody({super.key, required this.allQuestion});
  final List<QuestionsEntity> allQuestion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
          title: "Answers",
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 32),
        Expanded(child: ListQuestionResultItems(allQuestion: allQuestion)),
      ],
    );
  }
}
