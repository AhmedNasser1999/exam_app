import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/widgets/custom_question_item.dart';
import 'package:flutter/material.dart';

class ListQuestionResultItems extends StatelessWidget {
  const ListQuestionResultItems({super.key, required this.allQuestion});
  final List<QuestionsEntity> allQuestion;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          CustomQuestionItem(questionsEntity: allQuestion[index]),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
    );
  }
}
