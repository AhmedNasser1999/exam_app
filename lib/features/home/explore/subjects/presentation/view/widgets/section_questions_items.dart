import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/widgets/custom_questions_items.dart';
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
        ListView.separated(
          itemBuilder: (context, index) => const CustomQuestionsItems(),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: 4,
          shrinkWrap: true,
        ),
        const SizedBox(height: 80),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: CustomButton(
                buttonModel: ButtonModel(
                  text: "Back",
                  onPressed: () {},
                  backgroundColor: theme.colorScheme.onSecondary,
                  textColor: theme.colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                buttonModel: ButtonModel(text: "Next", onPressed: () {}),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
