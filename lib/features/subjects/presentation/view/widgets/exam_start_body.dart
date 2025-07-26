import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/subjects/presentation/view/all_exam_view.dart';
import 'package:exam_app/features/subjects/presentation/view/widgets/custom_exam_instructions.dart';
import 'package:flutter/material.dart';

class ExamStartBody extends StatelessWidget {
  const ExamStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const CustomHeader(title: "Exam", backRouteName: AllExamView.routeName),
        const SizedBox(height: 24),
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
                  Text("Exam Name", style: theme.textTheme.titleLarge),
                  const Spacer(),
                  Text(
                    "30 Minutes",
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
                  "20 Question",
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
                onPressed: () {},
                borderRadius: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
