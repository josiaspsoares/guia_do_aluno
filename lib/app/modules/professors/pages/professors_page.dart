import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/professors/controllers/professors_controller.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/modules/professors/widgets/professor_card.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/generic_error_widget/generic_error_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/simple_loading_widget/simple_loading_widget.dart';
import 'package:sizer/sizer.dart';

class ProfessorsPage extends StatefulWidget {
  const ProfessorsPage({Key? key}) : super(key: key);

  @override
  _ProfessorsPageState createState() => _ProfessorsPageState();
}

class _ProfessorsPageState
    extends ModularState<ProfessorsPage, ProfessorsController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.professors!.data == null) {
        return const SimpleLoadingWidget();
      } else if (controller.professors!.hasError) {
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
        List<ProfessorModel> list = controller.professors!.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "PROFESSORES",
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: AppColors.appBarBackground,
            centerTitle: true,
            actions: controller.userRole == "admin" ||
                    controller.userRole == "professor" 
                ? [
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/professores/cadastro',
                        );
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
                ProfessorModel model = list[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                  child: ProfessorCard(
                    onDoubleTap: controller.userRole == "admin" ||
                            controller.userRole == "professor" 
                        ? () {
                            Modular.to.pushNamed(
                              '/professores/atualizacao',
                              arguments: model,
                            );
                          }
                        : null,
                    professor: model,
                  ),
                );
              }),
        );
      }
    });
  }
}
