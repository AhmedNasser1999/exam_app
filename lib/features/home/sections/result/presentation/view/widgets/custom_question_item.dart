import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/result/domain/entity/result_answer_entity.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/widgets/custom_result_item.dart';
import 'package:flutter/material.dart';

class CustomQuestionItem extends StatelessWidget {
  const CustomQuestionItem({super.key, required this.questionsEntity});
  final QuestionsEntity questionsEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(questionsEntity.question, style: theme.textTheme.titleMedium),
            ListView.separated(
              itemBuilder: (context, index) => CustomResultItem(
                answerEntity: ResultAnswerEntity(
                  answer: questionsEntity.answer[index].answer,
                  key: questionsEntity.answer[index].key,
                  correctAnswer: questionsEntity.correctAnswerKey,
                  isSelected: questionsEntity.answer[index].isSelected,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
