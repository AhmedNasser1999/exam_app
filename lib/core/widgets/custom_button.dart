import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const CustomButton({super.key, required this.buttonModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: buttonModel.width ?? double.infinity,
      height: buttonModel.height ?? 55,
      child: MaterialButton(
        onPressed: buttonModel.onPressed,
        elevation: 0,
        color: buttonModel.backgroundColor ?? theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonModel.borderRadius),
          side: BorderSide(
            color: buttonModel.backgroundColor != null
                ? const Color(0xff022D82)
                : Colors.transparent,
          ),
        ),
        child: Text(
          buttonModel.text,
          style:
              buttonModel.textStyle ??
              theme.textTheme.titleSmall!.copyWith(
                color: buttonModel.textColor ?? theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
