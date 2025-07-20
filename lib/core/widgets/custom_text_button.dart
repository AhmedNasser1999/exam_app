import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    required this.routeName,
  });

  final String textButton, routeName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
        child: Text(
          textButton,
          style: theme.textTheme.titleSmall!.copyWith(
            decoration: TextDecoration.underline,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
