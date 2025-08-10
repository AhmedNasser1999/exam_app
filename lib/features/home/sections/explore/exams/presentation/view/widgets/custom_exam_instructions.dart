import 'package:flutter/material.dart';

class CustomExamInstructions extends StatelessWidget {
  const CustomExamInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text("Instructions", style: Theme.of(context).textTheme.titleMedium),

        Text(
          "• Read each question carefully.",
          style: theme.textTheme.bodyMedium,
        ),
        Text("• Select the best answer.", style: theme.textTheme.bodyMedium),
        Text("• Do not refresh the page.", style: theme.textTheme.bodyMedium),
        Text(
          "• Submit before the time ends.",
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
