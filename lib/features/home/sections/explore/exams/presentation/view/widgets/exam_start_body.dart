import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/custom_exam_instructions.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/quiz_exam_view.dart';
import 'package:flutter/material.dart';

class ExamStartBody extends StatelessWidget {
  const ExamStartBody({super.key, required this.examInfoEntity});
  final ExamEntity? examInfoEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 345 / 50,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(AppAssets.imagesExamIcon),
                  ),
                  Text(
                    examInfoEntity?.title ?? "",
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  Text(
                    "${examInfoEntity?.duration ?? 0} Minutes",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("High level", style: theme.textTheme.titleMedium),
                Container(
                  color: theme.colorScheme.primary,
                  height: 15,
                  width: 1.2,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
                Text(
                  "${examInfoEntity?.numberOfQuestions ?? 0} Question",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.5),
            const CustomExamInstructions(),
            const SizedBox(height: 48),
            CustomButton(
              buttonModel: ButtonModel(
                text: TextConstant.start,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    QuizExamView.routeName,
                    arguments: examInfoEntity,
                  );
                },
                borderRadius: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
