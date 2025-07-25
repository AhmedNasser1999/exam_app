import 'package:flutter/widgets.dart';

class TextFieldModel {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final IconData? iconData; // <- Use IconData
  bool obscureText;
  double borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  TextFieldModel({
    this.borderRadius = 5.0,
    required this.controller,
    required this.label,
    required this.hintText,
    this.iconData,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });
}
