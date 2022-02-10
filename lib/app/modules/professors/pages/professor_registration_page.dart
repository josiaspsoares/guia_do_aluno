import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/professors/controllers/professors_controller.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_borders.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:guia_do_aluno/app/shared/widgets/submit_button/submit_button.dart';
import 'package:sizer/sizer.dart';

class ProfessorRegistrationPage extends StatefulWidget {
  final ProfessorModel? professor;
  const ProfessorRegistrationPage({Key? key, this.professor}) : super(key: key);

  @override
  State<ProfessorRegistrationPage> createState() =>
      _ProfessorRegistrationPageState();
}

class _ProfessorRegistrationPageState
    extends ModularState<ProfessorRegistrationPage, ProfessorsController> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _professorNameFocusNode;
  late FocusNode _professorEmailFocusNode;
  late FocusNode _professorPhoneFocusNode;
  late FocusNode _submitButtonFocusNode;

  @override
  void initState() {
    if (widget.professor != null) {
      controller.professorNameController.text = widget.professor!.name;
      controller.professorEmailController.text = widget.professor!.email;
      controller.professorPhoneController.text = widget.professor!.phone;
    }

    _professorNameFocusNode = FocusNode();
    _professorEmailFocusNode = FocusNode();
    _professorPhoneFocusNode = FocusNode();
    _submitButtonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _professorNameFocusNode.dispose();

    _professorEmailFocusNode.dispose();
    _professorPhoneFocusNode.dispose();
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          widget.professor == null
              ? "Cadastro".toUpperCase()
              : "Atualização".toUpperCase(),
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        actions: widget.professor != null
            ? [
                IconButton(
                  onPressed: () {
                    controller.delete(documentID: widget.professor!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: 'Professor apagado com sucesso!',
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
            _buildProfessorName(),
            SizedBox(height: 2.h),
            _buildProfessorEmail(),
            SizedBox(height: 2.h),
            _buildProfessorPhone(),
            SizedBox(height: 2.h),
            widget.professor == null
                ? _buildSubmitButton()
                : _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessorName() => TextFormField(
        controller: controller.professorNameController,
        focusNode: _professorNameFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Nome',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.userTie,
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
            return 'Informe um nome';
          }
          return null;
        },
      );

       Widget _buildProfessorEmail() => TextFormField(
        controller: controller.professorEmailController,
        focusNode: _professorEmailFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.solidEnvelope,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value != "" && !value!.contains('@')) {
            return 'Informe um email válido';
          }
          return null;
        },
      );

       Widget _buildProfessorPhone() => TextFormField(
        controller: controller.professorPhoneController,
        focusNode: _professorPhoneFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.datetime,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ],
        decoration: InputDecoration(
          labelText: 'Telefone',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.phoneAlt,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value != "" && value!.length < 14) {
            return 'Informe um telefone com seu DDD';
          }
          return null;
        },
      );

  Widget _buildSubmitButton() => SubmitButton(
        focusNode: _submitButtonFocusNode,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.add(
              professor: ProfessorModel(
                id: "",
                name: controller.professorNameController.text,
                email: controller.professorEmailController.text,
                phone: controller.professorPhoneController.text,
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
              documentID: widget.professor!.id,
              professor: ProfessorModel(
                id: widget.professor!.id,
                name: controller.professorNameController.text,
                email: controller.professorEmailController.text,
                phone: controller.professorPhoneController.text,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(
                message: 'Professor atualizado com sucesso!',
                color: Colors.blue,
              ),
            );
            Modular.to.pop();
          }
        },
        text: 'Atualizar',
      );
}
