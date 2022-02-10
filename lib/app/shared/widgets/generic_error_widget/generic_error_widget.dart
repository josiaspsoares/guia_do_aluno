import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/shadow_button/shadow_button.dart';
import 'package:sizer/sizer.dart';

class GenericErrorWidget extends StatelessWidget {
  final GenericErrorModel error;

  const GenericErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 14.h, bottom: 10.h, left: 5.w, right: 5.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                error.imageUrl,
                width: 277,
                height: 288,
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                error.title,
                style: AppTextStyles.titleBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  error.message,
                  style: AppTextStyles.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Visibility(
                visible: error.hasButton == true,
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    ShadowButton(
                      text: error.buttonText!,
                      color: error.buttonColor,
                      onTap: error.buttonAction!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
