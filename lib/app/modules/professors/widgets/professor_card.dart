import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/email_button/email_button.dart';
import 'package:guia_do_aluno/app/shared/widgets/whatsapp_button/whatsapp_button.dart';
import 'package:sizer/sizer.dart';

class ProfessorCard extends StatelessWidget {
  final ProfessorModel professor;
   final VoidCallback? onDoubleTap;
  const ProfessorCard({Key? key, required this.professor, this.onDoubleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
         onDoubleTap: onDoubleTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
            color: AppColors.cardBackground,
          ),
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      professor.name.toUpperCase(),
                      style: AppTextStyles.professorTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.phoneAlt,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        text: "Telefone: ",
                        style: AppTextStyles.professorDetailsMedium,
                        children: [
                          TextSpan(
                            text: professor.phone == ""
                                ? "Indisponível"
                                : professor.phone,
                            style: AppTextStyles.professorDetailsRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.4.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidEnvelope,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        text: "Email: ",
                        style: AppTextStyles.professorDetailsMedium,
                        children: [
                          TextSpan(
                            text: professor.email == ""
                                ? "Indisponível"
                                : professor.email,
                            style: AppTextStyles.professorDetailsRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(professor.email != "")
                    EmailButton(
                      email: professor.email,
                    ),
                    if (professor.email != "" && professor.phone != "")
                    SizedBox(width: 5.w,),
                    if(professor.phone != "")
                    WhatsappButton(
                      phone: professor.phone,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.4.h,
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
