import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailButton extends StatelessWidget {
  final String email;
  const EmailButton({Key? key, required this.email}) : super(key: key);

  Future<void> _sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: '',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: _sendEmail,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.emailButtonBackground),
          overlayColor: MaterialStateProperty.all(
            AppColors.socialButton.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FaIcon(
              FontAwesomeIcons.solidPaperPlane,
              color: AppColors.socialButton,
            ),
            Text(
              "Email",
              style: AppTextStyles.socialButton,
            ),
          ],
        ),
      ),
    );
  }
}
