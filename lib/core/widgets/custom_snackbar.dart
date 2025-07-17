import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

customSnackBar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  return SnackBar(
    elevation: 0,

    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
      inMaterialBanner: true,
    ),
  );
}
