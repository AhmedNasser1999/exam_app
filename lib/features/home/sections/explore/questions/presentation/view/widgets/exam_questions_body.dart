import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_quiz_exam_header.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/question_page_view.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/quiz_exam_button.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/exam_quiz/exam_question_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamQuestionsBody extends StatelessWidget {
  const ExamQuestionsBody({super.key, required this.listQuestion});
  final List<QuestionsEntity> listQuestion;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ExamQuestionCubit>();
    return Column(
      children: [
        const CustomQuizExamHeader(),
        const SizedBox(height: 8),
        Text(
          "Question ${1 + cubit.currentPage} of ${cubit.allQuestion.length}",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        LinearProgressIndicator(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(2),
          backgroundColor: AppColors.black[10],
          value: cubit.currentPage / (listQuestion.length - 1),
        ),
        const SizedBox(height: 28),
        QuestionPageView(allQuestion: listQuestion),
        const QuizExamButton(),
      ],
    );
  }
}
