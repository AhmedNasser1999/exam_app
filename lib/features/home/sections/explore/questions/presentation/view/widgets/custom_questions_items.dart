import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomQuestionsItems extends StatelessWidget {
  const CustomQuestionsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.blue[10],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          Text("Its going to rain today.", style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
