import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/notices/controllers/notice_controller.dart';
import 'package:guia_do_aluno/app/modules/notices/models/notice_model.dart';
import 'package:guia_do_aluno/app/modules/notices/widgets/notice_card.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/generic_error_widget/generic_error_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/simple_loading_widget/simple_loading_widget.dart';
import 'package:sizer/sizer.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({Key? key}) : super(key: key);

  @override
  _NoticesPageState createState() => _NoticesPageState();
}

class _NoticesPageState extends ModularState<NoticesPage, NoticeController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
     if (controller.notices!.data == null) {
        return const SimpleLoadingWidget();
      } else if (controller.notices!.hasError) {
        return GenericErrorWidget(
          error: GenericErrorModel(
            title: 'Ops!',
            message: 'Não foi possível obter as informações das disciplinas',
            hasButton: true,
            buttonText: 'Voltar para Home',
            buttonAction: () {
              Modular.to.pushReplacementNamed('/home');
            },
          ),
        );
      } else {
        List<NoticeModel> list = controller.notices!.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "AVISOS",
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: AppColors.appBarBackground,
            centerTitle: true,
            actions: controller.userRole == "admin" || controller.userRole == "professor" || controller.userRole == "leader"
                ? [
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed('/avisos/cadastro');
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ]
                : null,
            iconTheme: const IconThemeData(
              color: AppColors.appBarTitle,
            ),
          ),
          body: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              itemCount: list.length,
              itemBuilder: (_, index) {
                NoticeModel model = list[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                  child: NoticeCard(
                    onDoubleTap: controller.userRole == "admin" ||
                            controller.userRole == "professor" ||
                            controller.userRole == "leader" &&
                            controller.userID == model.userID
                        ? () {
                            Modular.to.pushNamed('/avisos/atualizacao',
                                arguments: model);
                          }
                        : null,
                    notice: model,
                  ),
                );
              }),
        );
      }
    });
  }
}
