import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, required this.routeName});
  final String title, routeName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(title, style: theme.textTheme.titleLarge),
      ],
    );
  }
}
