import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchButton extends StatelessWidget {
  final String url;
  final String name;
  final Color backgroundColor;
  final IconData icon;
  const LaunchButton({Key? key, required this.url, required this.name, required this.backgroundColor, required this.icon}) : super(key: key);

  void _launchUrl() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: _launchUrl,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.all(
            AppColors.socialButton.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              icon,
              color: AppColors.socialButton,
            ),
            Text(
              name,
              style: AppTextStyles.socialButton,
            ),
          ],
        ),
      ),
    );
  }
}
