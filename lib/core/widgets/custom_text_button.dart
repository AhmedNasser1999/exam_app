import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.textButton, this.onPressed});

  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: TextButton(
        onPressed: onPressed,
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
