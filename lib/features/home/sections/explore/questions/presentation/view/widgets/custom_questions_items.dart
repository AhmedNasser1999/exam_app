import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuestionsItems extends StatelessWidget {
  const CustomQuestionsItems({
    super.key,
    required this.answerModel,
    this.onTap,
    required this.id,
  });
  final AnswerEntity answerModel;
  final String id;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<QuestionCubit>();
    return BlocBuilder<QuestionCubit, QuestionState>(
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
                Checkbox(
                  value: answerModel.isSelected,
                  onChanged: (value) {
                    answerModel.isSelected = answerModel.isSelected == false
                        ? true
                        : false;
                    cubit.addNewAnswer(
                      answer: AnswerSubmitRequestModel(
                        questionId: id,
                        correct: answerModel.key,
                      ),
                      isSelected: answerModel.isSelected,
                    );
                  },
                ),
                Text(answerModel.answer, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        );
      },
    );
  }
}
