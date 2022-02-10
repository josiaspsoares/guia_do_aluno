import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/action_button/action_button.dart';
import 'package:guia_do_aluno/app/shared/widgets/google_meet_button/google_meet_button.dart';
import 'package:guia_do_aluno/app/shared/widgets/launch_button/launch_button.dart';
import 'package:sizer/sizer.dart';

class SubjectCard extends StatefulWidget {
  final SubjectModel subject;
  final VoidCallback? onDoubleTap;
  const SubjectCard(
      {Key? key, required this.subject, this.onDoubleTap})
      : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  String professorName = "";

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('professors')
        .doc(widget.subject.professorID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            professorName = data['name'];
          });
        }
      }
    });

    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onDoubleTap: widget.onDoubleTap,
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
                      widget.subject.name.toUpperCase(),
                      style: AppTextStyles.subjectTitle,
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
                    FontAwesomeIcons.userTie,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        text: "Professor: ",
                        style: AppTextStyles.subjectDetailsMedium,
                        children: [
                          TextSpan(
                            text: professorName,
                            style: AppTextStyles.subjectDetailsRegular,
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
                    FontAwesomeIcons.shapes,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        text: "Modalidade: ",
                        style: AppTextStyles.subjectDetailsMedium,
                        children: [
                          TextSpan(
                            text: widget.subject.modality,
                            style: AppTextStyles.subjectDetailsRegular,
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
              if (widget.subject.modality != "EAD") ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidCalendar,
                      size: 12.sp,
                      color: AppColors.icon,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: SelectableText.rich(
                        TextSpan(
                          text: "Horários de Aula: ",
                          style: AppTextStyles.subjectDetailsMedium,
                          children: [
                            for (var i = 0;
                                i < widget.subject.classDays.length;
                                i++)
                              TextSpan(
                                text:
                                    "\n ${widget.subject.classDays[i]} - ${widget.subject.classTime[i]}",
                                style: AppTextStyles.subjectDetailsRegular,
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
                if (widget.subject.link != "") ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.satelliteDish,
                        size: 12.sp,
                        color: AppColors.icon,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: "Encontro Conectado: ",
                            style: AppTextStyles.subjectDetailsMedium,
                            children: [
                              TextSpan(
                                text: widget.subject.link,
                                style: AppTextStyles.subjectDetailsRegular,
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
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleMeetButton(
                          url: widget.subject.link,
                        ),
                      ],
                    ),
                  ),
                ],
                if (widget.subject.recordedLessonsLink != "") ...[
                  SizedBox(
                    height: 0.8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LaunchButton(
                          url: widget.subject.recordedLessonsLink,
                          name: "VER GRAVAÇÕES",
                          backgroundColor: AppColors.recordedLessonsBackground,
                          icon: FontAwesomeIcons.solidFileVideo,
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(
                  height: 0.8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                        name: "ACESSAR MATERIAIS",
                        backgroundColor: AppColors.coursewareButtonBackground,
                        icon: FontAwesomeIcons.infoCircle,
                        onPressed: () {
                          Modular.to.pushNamed('/materiais',
                              arguments: widget.subject.id);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.4.h,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
