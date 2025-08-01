import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/cubit/exam_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuestionsItems extends StatelessWidget {
  const CustomQuestionsItems({
    super.key,
    required this.answerModel,
    this.onTap,
  });
  final AnswerEntity answerModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ExamQuestionCubit>();
    return BlocBuilder<ExamQuestionCubit, ExamQuestionState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: answerModel.isSelected
                  ? AppColors.blue[10]
                  : AppColors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Checkbox(value: answerModel.isSelected, onChanged: (value) {}),
                Text(answerModel.answer, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        );
      },
    );
  }
}
