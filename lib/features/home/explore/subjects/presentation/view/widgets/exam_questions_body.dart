import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/all_exam_view.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/widgets/section_questions_items.dart';

import 'package:flutter/material.dart';
    
class ExamQuestionsBody extends StatelessWidget {
  const ExamQuestionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            const CustomHeader(
              title: "Exam",
              backRouteName: AllExamView.routeName,
            ),
            const Spacer(),
            Image.asset(AppAssets.imagesClock),
            const SizedBox(width: 8),
            Text(
              "20.19",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Question 2 of 20",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        LinearProgressIndicator(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(2),
          backgroundColor: AppColors.black[10],
          value: 1 / 10,
        ),
        const SizedBox(height: 28),
        const SectionQuestionsItems(),
      ],
    );
  }
}
