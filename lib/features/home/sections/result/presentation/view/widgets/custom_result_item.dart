import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/sections/result/domain/entity/result_answer_entity.dart';
import 'package:flutter/material.dart';

class CustomResultItem extends StatelessWidget {
  const CustomResultItem({super.key, required this.answerEntity});
  final ResultAnswerEntity answerEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: answerEntity.key == answerEntity.correctAnswer
            ? AppColors.lightGreen
            : answerEntity.isSelected
            ? AppColors.lightRed
            : AppColors.lightBlue,

        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: answerEntity.key == answerEntity.correctAnswer
              ? AppColors.green
              : answerEntity.isSelected
              ? AppColors.red
              : AppColors.lightBlue,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: answerEntity.correctAnswer,
            groupValue: answerEntity.key,
            onChanged: (value) {},
            activeColor: AppColors.green,
          ),
          Text(answerEntity.answer, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
