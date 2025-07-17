import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.textButton,
    required this.routeName,
  });
  final String label, textButton, routeName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: theme.textTheme.titleSmall),
        TextButton(
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
      ],
    );
  }
}
