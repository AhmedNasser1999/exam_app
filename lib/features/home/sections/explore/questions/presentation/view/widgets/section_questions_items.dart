import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/list_question_items.dart';
import 'package:flutter/material.dart';

class SectionQuestionsItems extends StatelessWidget {
  const SectionQuestionsItems({super.key, required this.questionsEntity});
  final QuestionsEntity questionsEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionsEntity.question,
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 24),
        ListQuestionItems(questionsEntity: questionsEntity),
      ],
    );
  }
}
