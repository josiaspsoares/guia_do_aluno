import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppBorders {
  static const formBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.formBorder),
  );
  static const focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.formBorder, width: 2),
  );
  static const errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.formBorder, width: 2),
  );
}
