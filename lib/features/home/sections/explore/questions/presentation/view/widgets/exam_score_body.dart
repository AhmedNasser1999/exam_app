import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/result_score_item_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_result_chart.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_result_score.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/exam_quiz/exam_question_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScoreBody extends StatelessWidget {
  const ExamScoreBody({super.key, required this.examInfo});
  final ExamEntity examInfo;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ExamQuestionCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(
          title: TextConstant.examScoreTitle,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(height: 40),
        Text(TextConstant.yourScore, style: theme.textTheme.titleMedium),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Expanded(
              child: CustomResultChart(
                number: cubit.result.total != "NaN%"
                    ? double.tryParse(
                            cubit.result.total.substring(
                              0,
                              cubit.result.total.length - 1,
                            ),
                          ) ??
                          0
                    : 0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                spacing: 10,
                children: [
                  CustomResultScoreItem(
                    resultScoreItemModel: ResultScoreItemModel(
                      title: TextConstant.correct,
                      numberOfResult: cubit.result.correctAnswer.toString(),
                      colorItem: theme.colorScheme.primary,
                    ),
                  ),
                  CustomResultScoreItem(
                    resultScoreItemModel: ResultScoreItemModel(
                      title: TextConstant.incorrect,
                      numberOfResult: cubit.result.inCorrectAnswer.toString(),
                      colorItem: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 80),
        CustomButton(
          buttonModel: ButtonModel(
            text: TextConstant.showResult,
            onPressed: () {},
            borderRadius: 25,
          ),
        ),
        const SizedBox(height: 24),
        CustomButton(
          buttonModel: ButtonModel(
            text: TextConstant.startAgain,
            onPressed: () {
              cubit.startExamAgain(exam: examInfo);
            },
            backgroundColor: theme.colorScheme.onSecondary,
            borderRadius: 25,
            textColor: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
