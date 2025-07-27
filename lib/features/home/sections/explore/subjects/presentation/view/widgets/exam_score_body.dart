import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/result_score_item_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/all_exam_view.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/custom_result_chart.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/custom_result_score.dart';

import 'package:flutter/material.dart';

class ExamScoreBody extends StatelessWidget {
  const ExamScoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeader(
          title: TextConstant.examScoreTitle,
          backRouteName: AllExamView.routeName,
        ),
        const SizedBox(height: 40),
        Text(TextConstant.yourScore, style: theme.textTheme.titleMedium),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            const Expanded(child: CustomResultChart(number: 67)),
            Expanded(
              flex: 1,
              child: Column(
                spacing: 10,
                children: [
                  CustomResultScoreItem(
                    resultScoreItemModel: ResultScoreItemModel(
                      title: TextConstant.correct,
                      numberOfResult: '18',
                      colorItem: theme.colorScheme.primary,
                    ),
                  ),
                  CustomResultScoreItem(
                    resultScoreItemModel: ResultScoreItemModel(
                      title: TextConstant.incorrect,
                      numberOfResult: '2',
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
            onPressed: () {},
            backgroundColor: theme.colorScheme.onSecondary,
            borderRadius: 25,
            textColor: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
