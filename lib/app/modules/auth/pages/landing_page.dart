import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/auth/controllers/auth_controller.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_images.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/loading_widget/loading_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/shadow_button/shadow_button.dart';
import 'package:mobx/mobx.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends ModularState<LandingPage, AuthController> {
  final overlayLoading = OverlayEntry(builder: (_) {
    return const LoadingWidget();
  });

  @override
  void initState() {
    super.initState();
    reaction<bool>((_) => controller.loading, (isLoading) {
      if (isLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.user != null) {
        Modular.to.pushReplacementNamed('/home');
      }
      
      return Scaffold(
        body: SingleChildScrollView(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 10.h, left: 5.w, right: 5.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.logoFull,
                  width: 277,
                  height: 288,
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "Guia do Aluno",
                  style: AppTextStyles.titleBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Seja bem-vindo ao Guia do Aluno. Faça login com seu endereço de email institucional",
                    style: AppTextStyles.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                ShadowButton(
                  text: "Entre com o Google",
                  color: AppColors.primary,
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
