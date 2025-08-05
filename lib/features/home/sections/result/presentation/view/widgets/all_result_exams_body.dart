import 'package:exam_app/core/constant/text_constant.dart';

import 'package:exam_app/features/home/sections/result/presentation/view/widgets/section_all_exams_results.dart';
import 'package:flutter/material.dart';

class AllResultExamsBody extends StatelessWidget {
  const AllResultExamsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextConstant.resultsLabel, style: theme.textTheme.titleLarge),
        const SizedBox(height: 40),
        const Expanded(child: SectionAllExamsResults()),
      ],
    );
  }
}
