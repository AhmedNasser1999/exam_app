import 'package:exam_app/core/constant/text_constant.dart';

import 'package:exam_app/features/home/sections/result/presentation/view/widgets/list_all_exam_item.dart';
import 'package:flutter/material.dart';

class SectionAllExamsResults extends StatelessWidget {
  const SectionAllExamsResults({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextConstant.exams, style: theme.textTheme.titleMedium),
        const SizedBox(height: 24),
        const Expanded(child: ListAllExamItems()),
      ],
    );
  }
}
