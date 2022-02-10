import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';

class SubmitButton extends StatelessWidget {
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final String text;

  const SubmitButton({
    Key? key,
    required this.focusNode,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: ElevatedButton(
        focusNode: focusNode,
        autofocus: true,
        style: ElevatedButton.styleFrom(
          primary: AppColors.submittButton,
          padding: EdgeInsets.all(1.3.h),
        ),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: AppTextStyles.submitButton,
        ),
      ),
    );
  }
}
