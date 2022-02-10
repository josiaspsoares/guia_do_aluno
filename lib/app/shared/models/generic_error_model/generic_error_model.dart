import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_images.dart';

class GenericErrorModel {
  final String title;
  final String message;
  final String imageUrl;
  final Color buttonColor;
  final bool? hasButton;
  final String? buttonText;
  final VoidCallback? buttonAction;
  
  GenericErrorModel({
    required this.title,
    required this.message,
    this.hasButton = false,
    this.imageUrl = AppImages.errorForbidden,
    this.buttonColor = AppColors.errorBackground,
    this.buttonText,
    this.buttonAction,
  });
}
