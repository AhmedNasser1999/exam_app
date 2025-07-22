import 'package:flutter/material.dart';

class CustomSectionIdentifierScreen extends StatelessWidget {
  const CustomSectionIdentifierScreen({
    super.key,
    required this.title,
    required this.description,
  });
  final String title, description;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        const SizedBox(height: 16.0),
        Text(
         description,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
