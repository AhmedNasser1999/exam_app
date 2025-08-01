import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_questions_items.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/cubit/exam_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionQuestionsItems extends StatelessWidget {
  const SectionQuestionsItems({super.key, required this.questionsEntity});
  final QuestionsEntity questionsEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ExamQuestionCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionsEntity.question,
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 24),
        ListView.separated(
          itemBuilder: (context, index) => CustomQuestionsItems(
            answerModel: questionsEntity.answer[index],
            onTap: () {
              questionsEntity.answer[index].isSelected =
                  !questionsEntity.answer[index].isSelected;
              cubit.selectedQuestion();
            },
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: questionsEntity.answer.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
