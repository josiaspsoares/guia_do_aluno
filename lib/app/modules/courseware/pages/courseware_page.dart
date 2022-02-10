import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/courseware/controllers/courseware_controller.dart';
import 'package:guia_do_aluno/app/modules/courseware/models/courseware_model.dart';
import 'package:guia_do_aluno/app/modules/courseware/widgets/courseware_card.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/generic_error_widget/generic_error_widget.dart';
import 'package:guia_do_aluno/app/shared/widgets/simple_loading_widget/simple_loading_widget.dart';
import 'package:sizer/sizer.dart';

class CoursewarePage extends StatefulWidget {
  const CoursewarePage({Key? key, this.subjectID}) : super(key: key);
  final String? subjectID;

  @override
  _CoursewarePageState createState() => _CoursewarePageState();
}

class _CoursewarePageState
    extends ModularState<CoursewarePage, CoursewareController> {
  @override
  void initState() {
    if (widget.subjectID != null) {
      controller.subjectId = widget.subjectID;
      controller.getCousewares(controller.subjectId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.coursewares!.data == null) {
        return const SimpleLoadingWidget();
      } else if (controller.coursewares!.hasError) {
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
        List<CoursewareModel> list = controller.coursewares!.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "MATERIAIS",
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
                          '/materiais/cadastro',
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
                CoursewareModel model = list[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                  child: CoursewareCard(
                    onDoubleTap: controller.userRole == "admin" ||
                            controller.userRole == "professor" 
                        ? () {
                            Modular.to.pushNamed('/materiais/atualizacao',
                                arguments: model);
                          }
                        : null,
                    courseware: model,
                  ),
                );
              }),
        );
      }
    });
  }
}
