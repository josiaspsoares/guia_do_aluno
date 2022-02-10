import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/notices/models/notice_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeCard extends StatefulWidget {
  final NoticeModel notice;
  final VoidCallback? onDoubleTap;
  const NoticeCard({Key? key, required this.notice, this.onDoubleTap})
      : super(key: key);

  @override
  State<NoticeCard> createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard> {
  String userName = "";
  String userAvatar = "";

  void _launchURL({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.notice.userID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            userName = data['name'];
            userAvatar = data['avatarUrl'];
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
                      widget.notice.title.toUpperCase(),
                      style: AppTextStyles.noticeTitle,
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
                  Expanded(
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.notice.description,
                            style: AppTextStyles.noticeDetailsRegular,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              if (widget.notice.link != "") ...[
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
                              text: widget.notice.link,
                              style: AppTextStyles.subjectDetailsRegular.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          _launchURL(url: widget.notice.link);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: userAvatar != "" ? NetworkImage(userAvatar) : null,
                    backgroundColor: AppColors.cardBackground,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Enviado por ",
                        style: AppTextStyles.noticeDetailsMedium,
                        children: [
                          TextSpan(
                            text: userName,
                            style: AppTextStyles.noticeDetailsRegular,
                          ),
                          TextSpan(
                            text: " em ",
                            style: AppTextStyles.noticeDetailsRegular,
                          ),
                          TextSpan(
                            text: DateFormat('dd/MM/yyyy - kk:mm')
                                .format(widget.notice.sendDate),
                            style: AppTextStyles.noticeDetailsRegular,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
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
