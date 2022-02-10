import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/auth/controllers/auth_controller.dart';
import 'package:guia_do_aluno/app/modules/home/controllers/home_controller.dart';
import 'package:guia_do_aluno/app/modules/home/widgets/home_widget.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/widgets/loading_widget/loading_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/webview_widget/webview_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, AuthController> {
  final homeController = Modular.get<HomeController>();

  final overlayLoading = OverlayEntry(builder: (_) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.circularProgressIndicator,
        ),
      ),
    );
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

  void launchADX() async => await canLaunch('https://adx.doctum.edu.br/')
      ? await launch('https://adx.doctum.edu.br/')
      : throw 'Could not launch https://adx.doctum.edu.br/';

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.user == null) {
        return const LoadingWidget();
      }

      return Scaffold(
        body: getBody(),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: AppColors.bottomNavigationBarBackground,
          style: TabStyle.textIn,
          items: const [
            TabItem(icon: Icons.school, title: 'ADX'),
            TabItem(icon: Icons.home, title: 'Home'),
          ],
          initialActiveIndex: 1,
          onTap: (int index) {
            if (index == 0 && kIsWeb) {        
              launchADX();
            } else {
              homeController.index = index;
            }
          },
        ),
      );
    });
  }

  Widget getBody() {
    switch (homeController.index) {
      case 0:
        return const WebviewWidget(url: 'https://adx.doctum.edu.br/');
      case 1:
        return HomeWidget(
          user: controller.user!,
          signOut: () async {
            await controller.signOut();
          },
        );
      default:
        return const LoadingWidget();
    }
  }
}
