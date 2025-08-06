import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textFieldModel.controller,
      keyboardType: textFieldModel.keyboardType ?? TextInputType.name,
      obscureText: textFieldModel.obscureText,
      decoration: InputDecoration(
        suffixIcon: textFieldModel.suffixIcon,
        labelText: textFieldModel.label,
        hintText: textFieldModel.hintText,
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.placeHolder,
        ),
        labelStyle: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldModel.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldModel.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldModel.borderRadius),
        ),
      ),
      validator: textFieldModel.validator ?? Validation.validateText,
      onChanged: textFieldModel.onChanged,
    );
  }
}
