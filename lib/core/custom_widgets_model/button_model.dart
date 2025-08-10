import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  ButtonModel({
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12.0,
    this.textStyle,
    this.icon,
  });
}
