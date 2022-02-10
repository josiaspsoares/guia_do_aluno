import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class UserCard extends StatelessWidget {
  final String subject;
  final UserModel user;
  final VoidCallback onPressed;

  const UserCard(
      {Key? key,
      required this.subject,
      required this.user,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  subject,
                  style: AppTextStyles.homeTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  user.name,
                  style: AppTextStyles.userName,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  user.email,
                  style: AppTextStyles.userEmail,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                      image: NetworkImage(
                        user.avatarUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Sair',
                    style: AppTextStyles.buttonWhite,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.title),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
