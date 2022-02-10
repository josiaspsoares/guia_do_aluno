import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/subjects/controllers/subject_controller.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/widgets/subject_card.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/generic_error_widget/generic_error_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/simple_loading_widget/simple_loading_widget.dart';
import 'package:sizer/sizer.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({Key? key}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends ModularState<SubjectsPage, SubjectController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.subjects!.data == null) {
        return const SimpleLoadingWidget();
      } else if (controller.subjects!.hasError) {
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
        List<SubjectModel> list = controller.subjects!.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "DISCIPLINAS",
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
                          '/disciplinas/cadastro',
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
                SubjectModel model = list[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                  child: SubjectCard(
                    onDoubleTap: controller.userRole == "admin" ||
                            controller.userRole == "professor" 
                        ? () {
                            Modular.to.pushNamed('/disciplinas/atualizacao',
                                arguments: model);
                          }
                        : null,
                    subject: model,
                  ),
                );
              }),
        );
      }
    });
  }
}
