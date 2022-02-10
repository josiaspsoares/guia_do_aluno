import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappButton extends StatelessWidget {
  final String phone;
  const WhatsappButton({Key? key, required this.phone}) : super(key: key);

  _sendWhatsAppMessage() async {
    var whatsappUrl = "whatsapp://send?phone=+55$phone&text=Olá,tudo bem?";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: _sendWhatsAppMessage,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.whatsappButtonBackground),
          overlayColor: MaterialStateProperty.all(
            AppColors.socialButton.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: AppColors.socialButton,
            ),
            Text(
              "Conversar",
              style: AppTextStyles.socialButton,
            ),
          ],
        ),
      ),
    );
  }
}
