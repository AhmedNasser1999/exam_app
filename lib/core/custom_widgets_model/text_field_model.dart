import 'package:flutter/widgets.dart';

class TextFieldModel {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  bool obscureText;
  double borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  TextFieldModel({
    this.suffixIcon,
    this.borderRadius = 5.0,
    this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });
}
