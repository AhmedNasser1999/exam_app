import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    this.backRouteName,
    this.onTap,
  });
  final String title;
  final String? backRouteName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: backRouteName != null
              ? () {
                  Navigator.pushReplacementNamed(context, backRouteName!);
                }
              : onTap,

          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(title, style: theme.textTheme.titleLarge),
      ],
    );
  }
}
