import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/custom_questions_items.dart';
import 'package:flutter/material.dart';

class SectionQuestionsItems extends StatelessWidget {
  const SectionQuestionsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Select the correctly punctuated sentence.",
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => const CustomQuestionsItems(),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
