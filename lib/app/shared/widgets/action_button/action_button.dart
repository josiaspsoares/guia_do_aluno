import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;
  const ActionButton(
      {Key? key,
      required this.name,
      required this.backgroundColor,
      required this.icon, required this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.all(
            AppColors.socialButton.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              icon,
              color: AppColors.socialButton,
            ),
            Text(
              name,
              style: AppTextStyles.socialButton,
            ),
          ],
        ),
      ),
    );
  }
}
