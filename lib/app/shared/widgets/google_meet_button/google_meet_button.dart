import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMeetButton extends StatelessWidget {
  final String url;
  const GoogleMeetButton({Key? key, required this.url}) : super(key: key);

  void _launchGoogleMeet() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: _launchGoogleMeet,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColors.googleMeetButtonBackground),
          overlayColor: MaterialStateProperty.all(
            AppColors.socialButton.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FaIcon(
              FontAwesomeIcons.video,
              color: AppColors.socialButton,
            ),
            Text(
              "ENTRAR NA AULA",
              style: AppTextStyles.socialButton,
            ),
          ],
        ),
      ),
    );
  }
}
