import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/modules/home/widgets/categories_grid_view.dart';
import 'package:guia_do_aluno/app/modules/home/widgets/user_card.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:sizer/sizer.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required this.user, required this.signOut})
      : super(key: key);

  final UserModel user;
  final VoidCallback signOut;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, Color(0x00ffffff)],
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.5.h, horizontal: 7.5.w),
            child: Column(
              children: [
                UserCard(
                  subject: "Ciência da Computação",
                  user: user,
                  onPressed: signOut,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CategoriesGridView(
                  user: user,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
