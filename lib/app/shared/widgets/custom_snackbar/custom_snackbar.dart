import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';

class CustomSnackBar extends SnackBar {
  final String message;
  final Color color;

  CustomSnackBar({
    Key? key,
    required this.message,
    required this.color,
  }) : super(
          key: key,
          content: Text(
            message,
            style: AppTextStyles.snackBar,
          ),
          backgroundColor: color,
        );
}
