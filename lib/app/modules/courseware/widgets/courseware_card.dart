import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/courseware/models/courseware_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursewareCard extends StatefulWidget {
  final CoursewareModel courseware;
  final VoidCallback? onDoubleTap;
  const CoursewareCard({Key? key, required this.courseware, this.onDoubleTap})
      : super(key: key);

  @override
  State<CoursewareCard> createState() => _CoursewareCardState();
}

class _CoursewareCardState extends State<CoursewareCard> {
  String subjectName = "";

  void _launchURL({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('subjects')
        .doc(widget.courseware.subjectID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            subjectName = data['name'];
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
                      widget.courseware.title.toUpperCase(),
                      style: AppTextStyles.coursewareTitle,
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
                    FontAwesomeIcons.infoCircle,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        text: "Descrição: ",
                        style: AppTextStyles.coursewareDetailsMedium,
                        children: [
                          TextSpan(
                            text: widget.courseware.description,
                            style: AppTextStyles.coursewareDetailsRegular,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
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
                        text: "Disciplina Relacionada: ",
                        style: AppTextStyles.coursewareDetailsMedium,
                        children: [
                          TextSpan(
                            text: subjectName,
                            style: AppTextStyles.coursewareDetailsRegular,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
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
                    FontAwesomeIcons.link,
                    size: 12.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.courseware.link,
                            style: AppTextStyles.subjectDetailsRegular.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        _launchURL(url: widget.courseware.link);
                      },
                    ),
                  ),
                ],
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
