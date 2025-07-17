import 'package:flutter/material.dart';

class TextFieldModel {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  TextFieldModel({
    required this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType,
    required this.obscureText,
    this.validator,
    this.onChanged,
  });
}
