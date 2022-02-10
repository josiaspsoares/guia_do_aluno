import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/modules/home/models/category_model.dart';
import 'package:sizer/sizer.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel model;
  final UserModel user;

  const CategoryCard({Key? key, required this.model, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(model.route);
      },
      child: Container(
        width: 3.w,
        height: 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.categoryCardBorder.withOpacity(0.7),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: AppColors.categoryCardBackground,
        ),
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 2.h,
          bottom: 2.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 12,
              child: Image.asset(model.imageUrl),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: Text(
                model.text,
                textAlign: TextAlign.center,
                style: AppTextStyles.categoryCaption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
