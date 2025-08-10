import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.backRouteName,
  });
  final String title, backRouteName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, backRouteName);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(title, style: theme.textTheme.titleLarge),
      ],
    );
  }
}
