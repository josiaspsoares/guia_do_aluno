import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/notices/controllers/notice_controller.dart';
import 'package:guia_do_aluno/app/modules/notices/models/notice_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_borders.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:guia_do_aluno/app/shared/widgets/submit_button/submit_button.dart';
import 'package:sizer/sizer.dart';

class NoticeRegistrationPage extends StatefulWidget {
  final NoticeModel? notice;
  const NoticeRegistrationPage({Key? key, this.notice}) : super(key: key);

  @override
  State<NoticeRegistrationPage> createState() => _NoticeRegistrationPageState();
}

class _NoticeRegistrationPageState
    extends ModularState<NoticeRegistrationPage, NoticeController> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _noticeTitleFocusNode;
  late FocusNode _noticeDescriptionFocusNode;
  late FocusNode _noticeLinkFocusNode;
  late FocusNode _submitButtonFocusNode;

  @override
  void initState() {
    if (widget.notice != null) {
      controller.noticeTitleController.text = widget.notice!.title;
      controller.noticeDescriptionController.text = widget.notice!.description;
      controller.noticeLinkController.text = widget.notice!.link;
    }

    _noticeTitleFocusNode = FocusNode();
    _noticeDescriptionFocusNode = FocusNode();
    _noticeLinkFocusNode = FocusNode();
    _submitButtonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _noticeTitleFocusNode.dispose();
    _noticeDescriptionFocusNode.dispose();
    _noticeLinkFocusNode.dispose();
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          widget.notice == null
              ? "Cadastro".toUpperCase()
              : "Atualização".toUpperCase(),
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        actions: widget.notice != null
            ? [
                IconButton(
                  onPressed: () {
                    controller.delete(documentID: widget.notice!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: 'Aviso apagado com sucesso!',
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
            _buildNoticeTitle(),
            SizedBox(height: 2.h),
            _buildNoticeDescription(),
            SizedBox(height: 2.h),
            _buildNoticeLink(),
            SizedBox(height: 2.h),
            widget.notice == null ? _buildSubmitButton() : _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeTitle() => TextFormField(
        controller: controller.noticeTitleController,
        focusNode: _noticeTitleFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Título',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.solidPaperPlane,
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

  Widget _buildNoticeDescription() => TextFormField(
        controller: controller.noticeDescriptionController,
        focusNode: _noticeDescriptionFocusNode,
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
        textInputAction: TextInputAction.newline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe uma descrição';
          }
          return null;
        },
      );

  Widget _buildNoticeLink() => TextFormField(
        controller: controller.noticeLinkController,
        focusNode: _noticeLinkFocusNode,
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
        textInputAction: TextInputAction.done,
        validator: (value) {
          return null;
        },
      );

  Widget _buildSubmitButton() => SubmitButton(
        focusNode: _submitButtonFocusNode,
        onPressed: () async {
          if (_formKey.currentState!.validate())  {
            
            controller.add(
              notice: NoticeModel(
                id: "",
                title: controller.noticeTitleController.text,
                description: controller.noticeDescriptionController.text,
                link: controller.noticeLinkController.text,
                userID: controller.userID!,
                sendDate: DateTime.now(),
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
              documentID: widget.notice!.id,
              notice: NoticeModel(
                id: widget.notice!.id,
                title: controller.noticeTitleController.text,
                description: controller.noticeDescriptionController.text,
                link: controller.noticeLinkController.text,
                userID: widget.notice!.userID,
                sendDate: widget.notice!.sendDate,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(
                message: 'Aviso atualizado com sucesso!',
                color: Colors.blue,
              ),
            );
            Modular.to.pop();
          }
        },
        text: 'Atualizar',
      );
}
