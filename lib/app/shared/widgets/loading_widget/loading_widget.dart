import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_images.dart';
import 'package:sizer/sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.loading,
              width: 277,
              height: 288,
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              width: 60.w,
              child: const LinearProgressIndicator(
                color: AppColors.primary,
                backgroundColor: Color(0xFFCADDFE),
                minHeight: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
