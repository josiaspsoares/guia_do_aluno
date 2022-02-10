import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class ShadowButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const ShadowButton(
      {Key? key, required this.text, required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 77.w,
        height: 6.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x333a296a),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          color: color,
        ),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 1.h,
          bottom: 1.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.buttonWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
