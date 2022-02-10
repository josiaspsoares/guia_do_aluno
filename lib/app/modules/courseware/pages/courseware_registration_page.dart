import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/courseware/controllers/courseware_controller.dart';
import 'package:guia_do_aluno/app/modules/courseware/models/courseware_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_borders.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:guia_do_aluno/app/shared/widgets/submit_button/submit_button.dart';
import 'package:sizer/sizer.dart';

class CoursewareRegistrationPage extends StatefulWidget {
  final CoursewareModel? courseware;
  const CoursewareRegistrationPage({Key? key, this.courseware})
      : super(key: key);

  @override
  State<CoursewareRegistrationPage> createState() =>
      _CoursewareRegistrationPageState();
}

class _CoursewareRegistrationPageState
    extends ModularState<CoursewareRegistrationPage, CoursewareController> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _coursewareTitleFocusNode;
  late FocusNode _coursewareDescriptionFocusNode;
  late FocusNode _coursewareLinkFocusNode;
  late FocusNode _coursewareSubjectFocusNode;
  late FocusNode _submitButtonFocusNode;

  @override
  void initState() {
    if (widget.courseware != null) {
      controller.titleController.text = widget.courseware!.title;
      controller.descriptionController.text = widget.courseware!.description;
      controller.linkController.text = widget.courseware!.link;
      controller.selectedSubjectId = widget.courseware!.subjectID;
    }

    _coursewareTitleFocusNode = FocusNode();
    _coursewareDescriptionFocusNode = FocusNode();
    _coursewareLinkFocusNode = FocusNode();
    _coursewareSubjectFocusNode = FocusNode();
    _submitButtonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _coursewareTitleFocusNode.dispose();
    _coursewareDescriptionFocusNode.dispose();
    _coursewareLinkFocusNode.dispose();
    _coursewareSubjectFocusNode.dispose();
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          widget.courseware == null
              ? "Cadastro".toUpperCase()
              : "Atualização".toUpperCase(),
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        actions: widget.courseware != null
            ? [
                IconButton(
                  onPressed: () {
                    controller.delete(documentID: widget.courseware!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: 'Material apagado com sucesso!',
                        color: Colors.red,
                      ),
                    );
                    Modular.to.pop();
                  },
                  icon: const Icon(Icons.delete),
                ),
              ]
            : [],
        iconTheme: const IconThemeData(
          color: AppColors.appBarTitle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
          children: [
            _buildCoursewareTitle(),
            SizedBox(height: 2.h),
            _buildCoursewareDescription(),
            SizedBox(height: 2.h),
            _buildCoursewareLink(),
            SizedBox(height: 2.h),
            _buildSubject(),
            SizedBox(height: 2.h),
            widget.courseware == null
                ? _buildSubmitButton()
                : _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoursewareTitle() => TextFormField(
        controller: controller.titleController,
        focusNode: _coursewareTitleFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Título',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.book,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe um título';
          }
          return null;
        },
      );

  Widget _buildCoursewareDescription() => TextFormField(
        controller: controller.descriptionController,
        focusNode: _coursewareDescriptionFocusNode,
        autofocus: true,
        minLines: 1,
        maxLines: 10,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Descrição',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.infoCircle,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe uma descrição';
          }
          return null;
        },
      );

  Widget _buildCoursewareLink() => TextFormField(
        controller: controller.linkController,
        focusNode: _coursewareLinkFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.url,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Link de Acesso',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.link,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe o link de acesso ao conteúdo';
          }
          return null;
        },
      );

  Widget _buildSubject() {
    return Observer(builder: (_) {
      if (controller.subjects!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<SubjectModel> subjectsList = controller.subjects!.data;

        controller.selectedSubjectId =
            controller.isSubjectIDValid(id: controller.selectedSubjectId)
                ? controller.selectedSubjectId
                : null;

        return DropdownButtonFormField(
          focusNode: _coursewareSubjectFocusNode,
          autofocus: true,
          value: controller.selectedSubjectId,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null) {
              return 'Escolha uma disciplina';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Disciplina Relacionada',
            labelStyle: AppTextStyles.formLabelText,
            icon: FaIcon(
              FontAwesomeIcons.shapes,
              size: 12.sp,
              color: AppColors.icon,
            ),
            enabledBorder: AppBorders.formBorder,
            border: AppBorders.formBorder,
            focusedBorder: AppBorders.focusedBorder,
          ),
          items: subjectsList.map((data) {
            return DropdownMenuItem<String>(
              value: data.id,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            controller.selectedSubjectId = value;
            _coursewareSubjectFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_submitButtonFocusNode);
          },
        );
      }
    });
  }

  Widget _buildSubmitButton() => SubmitButton(
        focusNode: _submitButtonFocusNode,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.add(
              courseware: CoursewareModel(
                id: "",
                title: controller.titleController.text,
                description: controller.descriptionController.text,
                link: controller.linkController.text,
                subjectID: controller.selectedSubjectId!,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(
                message: 'Cadastro realizado com sucesso!',
                color: Colors.teal,
              ),
            );
            Modular.to.pop();
          }
        },
        text: 'Cadastrar',
      );

  Widget _buildUpdateButton() => SubmitButton(
        focusNode: _submitButtonFocusNode,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.update(
              documentID: widget.courseware!.id,
              courseware: CoursewareModel(
                id: widget.courseware!.id,
                title: controller.titleController.text,
                description: controller.descriptionController.text,
                link: controller.linkController.text,
                subjectID: controller.selectedSubjectId!,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(
                message: 'Material atualizado com sucesso!',
                color: Colors.blue,
              ),
            );
            Modular.to.pop();
          }
        },
        text: 'Atualizar',
      );
}
