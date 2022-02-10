import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/controllers/subject_controller.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_day_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_time_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/modality_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/period_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/shared/themes/app_borders.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:guia_do_aluno/app/shared/themes/app_text_styles.dart';
import 'package:guia_do_aluno/app/shared/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:guia_do_aluno/app/shared/widgets/submit_button/submit_button.dart';
import 'package:sizer/sizer.dart';

class SubjectRegistrationPage extends StatefulWidget {
  final SubjectModel? subject;
  const SubjectRegistrationPage({Key? key, this.subject})
      : super(key: key);

  @override
  State<SubjectRegistrationPage> createState() =>
      _SubjectRegistrationPageState();
}

class _SubjectRegistrationPageState
    extends ModularState<SubjectRegistrationPage, SubjectController> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _subjectNameFocusNode;
  late FocusNode _professorFocusNode;
  late FocusNode _modalityFocusNode;
  late FocusNode _remoteClassLinkFocusNode;
  late FocusNode _recordedLessonsLinkFocusNode;
  late FocusNode _periodFocusNode;
  late FocusNode _classDaysFocusNode;
  late FocusNode _classTimeFocusNode;
  late FocusNode _submitButtonFocusNode;

  @override
  void initState() {
    if (widget.subject != null) {
      controller.subjectNameController.text = widget.subject!.name;
      controller.remoteClassLinkController.text = widget.subject!.link;
      controller.recordedLessonsLinkController.text =
          widget.subject!.recordedLessonsLink;
      controller.selectedProfessorId = widget.subject!.professorID;
      controller.selectedPeriodName = widget.subject!.period.toString();
      controller.selectedModalityName = widget.subject!.modality;
      controller.chosenClassDays = widget.subject!.classDays;
      controller.chosenClassTime = widget.subject!.classTime;
    }

    _subjectNameFocusNode = FocusNode();
    _professorFocusNode = FocusNode();
    _modalityFocusNode = FocusNode();
    _remoteClassLinkFocusNode = FocusNode();
    _recordedLessonsLinkFocusNode = FocusNode();
    _periodFocusNode = FocusNode();
    _classDaysFocusNode = FocusNode();
    _classTimeFocusNode = FocusNode();
    _submitButtonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _subjectNameFocusNode.dispose();
    _professorFocusNode.dispose();
    _modalityFocusNode.dispose();
    _remoteClassLinkFocusNode.dispose();
    _recordedLessonsLinkFocusNode.dispose();
    _periodFocusNode.dispose();
    _classDaysFocusNode.dispose();
    _classTimeFocusNode.dispose();
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          widget.subject == null
              ? "Cadastro".toUpperCase()
              : "Atualização".toUpperCase(),
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        actions: widget.subject != null
            ? [
                IconButton(
                  onPressed: () {
                    controller.delete(documentID: widget.subject!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: 'Disciplina apagada com sucesso!',
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
            _buildSubjectName(),
            SizedBox(height: 2.h),
            _buildProfessor(),
            SizedBox(height: 2.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildPeriod(),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  flex: 4,
                  child: _buildModality(),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            if (controller.selectedModalityName != "EAD") ...[
              _buildRemoteClassLink(),
              SizedBox(height: 2.h),
              _buildRecordedLessonsLink(),
              SizedBox(height: 2.h),
            ],
            if (controller.selectedModalityName != "EAD") ...[
              _buildClassDays(),
              Visibility(
                visible: controller.isClassDaySelected,
                child: SizedBox(height: 2.h),
              ),
              Visibility(
                visible: controller.isClassDaySelected,
                child: _buildClassTime(),
              ),
              SizedBox(height: 2.h),
              Wrap(
                spacing: 2.w,
                alignment: WrapAlignment.center,
                children: [
                  for (var i = 0; i < controller.chosenClassDays.length; i++)
                    InputChip(
                        padding: EdgeInsets.all(2.w),
                        backgroundColor: AppColors.chipColor,
                        deleteIconColor: Colors.white,
                        label: Text(
                          '${controller.chosenClassDays[i]} - ${controller.chosenClassTime[i]}',
                          style: AppTextStyles.chipText,
                        ),
                        onDeleted: () {
                          setState(() {
                            controller.chosenClassDays.removeAt(i);
                            controller.chosenClassTime.removeAt(i);
                          });
                        }),
                ],
              ),
              SizedBox(height: 2.h),
            ],
            widget.subject == null
                ? _buildSubmitButton()
                : _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectName() => TextFormField(
        controller: controller.subjectNameController,
        focusNode: _subjectNameFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Nome',
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
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe um nome';
          }
          return null;
        },
      );

  Widget _buildProfessor() {
    return Observer(builder: (_) {
      if (controller.professors!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<ProfessorModel> professorsList = controller.professors!.data;

        controller.selectedProfessorId =
            controller.isProfessorIDValid(id: controller.selectedProfessorId)
                ? controller.selectedProfessorId
                : null;

        return DropdownButtonFormField(
          focusNode: _professorFocusNode,
          autofocus: true,
          value: controller.selectedProfessorId,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null) {
              return 'Escolha um professor';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Professor',
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
          items: professorsList.map((data) {
            return DropdownMenuItem<String>(
              value: data.id,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            controller.selectedProfessorId = value;
            _professorFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_periodFocusNode);
          },
        );
      }
    });
  }

  Widget _buildPeriod() {
    return Observer(builder: (_) {
      if (controller.periods!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<PeriodModel> periodsList = controller.periods!.data;
        return DropdownButtonFormField(
          focusNode: _periodFocusNode,
          autofocus: true,
          value: controller.selectedPeriodName,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null) {
              return 'Escolha o período';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Período',
            labelStyle: AppTextStyles.formLabelText,
            icon: FaIcon(
              FontAwesomeIcons.solidBell,
              size: 12.sp,
              color: AppColors.icon,
            ),
            enabledBorder: AppBorders.formBorder,
            border: AppBorders.formBorder,
            focusedBorder: AppBorders.focusedBorder,
          ),
          items: periodsList.map((data) {
            return DropdownMenuItem<String>(
              value: data.name,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            controller.selectedPeriodName = value;
            _periodFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_modalityFocusNode);
          },
        );
      }
    });
  }

  Widget _buildModality() {
    return Observer(builder: (_) {
      if (controller.modalities!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<ModalityModel> modalitiesList = controller.modalities!.data;
        return DropdownButtonFormField(
          focusNode: _modalityFocusNode,
          autofocus: true,
          value: controller.selectedModalityName,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null) {
              return 'Escolha a modalidade';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Modalidade',
            labelStyle: AppTextStyles.formLabelText,
            icon: FaIcon(
              FontAwesomeIcons.graduationCap,
              size: 12.sp,
              color: AppColors.icon,
            ),
            enabledBorder: AppBorders.formBorder,
            border: AppBorders.formBorder,
            focusedBorder: AppBorders.focusedBorder,
          ),
          items: modalitiesList.map((data) {
            return DropdownMenuItem<String>(
              value: data.name,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              controller.selectedModalityName = value;
              _modalityFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_remoteClassLinkFocusNode);
            });
          },
        );
      }
    });
  }

  Widget _buildRemoteClassLink() => TextFormField(
        controller: controller.remoteClassLinkController,
        focusNode: _remoteClassLinkFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.url,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Encontro Conectado',
          //prefixText: widget.subject == null ? "https://meet.google.com/" : "",
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.satelliteDish,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          return null;
        
          
        },
      );

  Widget _buildRecordedLessonsLink() => TextFormField(
        controller: controller.recordedLessonsLinkController,
        focusNode: _recordedLessonsLinkFocusNode,
        autofocus: true,
        style: AppTextStyles.formText,
        keyboardType: TextInputType.url,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Gravações',
          labelStyle: AppTextStyles.formLabelText,
          icon: FaIcon(
            FontAwesomeIcons.solidFileVideo,
            size: 12.sp,
            color: AppColors.icon,
          ),
          enabledBorder: AppBorders.formBorder,
          border: AppBorders.formBorder,
          focusedBorder: AppBorders.focusedBorder,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          return null;
        
          
        },
      );

  Widget _buildClassDays() {
    return Observer(builder: (_) {
      if (controller.classDays!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<ClassDayModel> classDaysList = controller.classDays!.data;
        return DropdownButtonFormField(
          focusNode: _classDaysFocusNode,
          autofocus: true,
          value: controller.selectedClassDay,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (controller.selectedClassDay == null &&
                controller.chosenClassTime.isEmpty) {
              return 'Escolha o dia';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Dia',
            labelStyle: AppTextStyles.formLabelText,
            icon: FaIcon(
              FontAwesomeIcons.solidCalendar,
              size: 12.sp,
              color: AppColors.icon,
            ),
            enabledBorder: AppBorders.formBorder,
            border: AppBorders.formBorder,
            focusedBorder: AppBorders.focusedBorder,
          ),
          items: classDaysList.map((data) {
            return DropdownMenuItem<String>(
              value: data.name,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              controller.selectedClassDay = value;
              controller.isClassDaySelected = true;
              _classDaysFocusNode.nextFocus();
            });
          },
        );
      }
    });
  }

  Widget _buildClassTime() {
    return Observer(builder: (_) {
      if (controller.classTime!.data == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.circularProgressIndicator,
          ),
        );
      } else {
        List<ClassTimeModel> classTimeList = controller.classTime!.data;
        return DropdownButtonFormField(
          focusNode: _classTimeFocusNode,
          autofocus: true,
          value: controller.selectedClassTime,
          style: AppTextStyles.formText,
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (controller.chosenClassTime.isEmpty) {
              return 'Escolha o horário';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Horário',
            labelStyle: AppTextStyles.formLabelText,
            icon: FaIcon(
              FontAwesomeIcons.clock,
              size: 12.sp,
              color: AppColors.icon,
            ),
            enabledBorder: AppBorders.formBorder,
            border: AppBorders.formBorder,
            focusedBorder: AppBorders.focusedBorder,
          ),
          items: classTimeList.map((data) {
            return DropdownMenuItem<String>(
              value: data.name,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              controller.selectedClassTime = value;

              for (var i = 0; i < controller.chosenClassDays.length; i++) {
                if (controller.chosenClassDays[i] ==
                        controller.selectedClassDay &&
                    controller.chosenClassTime[i] == value) {
                  controller.selectedClassTime = null;
                  controller.selectedClassDay = null;
                  controller.isClassDaySelected = false;

                  _classTimeFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_classDaysFocusNode);
                  return;
                }
              }
              controller.chosenClassDays.add(controller.selectedClassDay!);
              controller.chosenClassTime.add(controller.selectedClassTime!);
              controller.selectedClassTime = null;
              controller.selectedClassDay = null;
              controller.isClassDaySelected = false;

              _classTimeFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_submitButtonFocusNode);
            });
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
              subject: SubjectModel(
                id: "",
                name: controller.subjectNameController.text,
                modality: controller.selectedModalityName!,
                link: controller.remoteClassLinkController.text,
                recordedLessonsLink:
                    controller.recordedLessonsLinkController.text,
                professorID: controller.selectedProfessorId!,
                period: int.parse(controller.selectedPeriodName!),
                classDays: controller.chosenClassDays,
                classTime: controller.chosenClassTime,
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
              documentID: widget.subject!.id,
              subject: SubjectModel(
                id: widget.subject!.id,
                name: controller.subjectNameController.text,
                modality: controller.selectedModalityName!,
                link: controller.remoteClassLinkController.text,
                recordedLessonsLink:
                    controller.recordedLessonsLinkController.text,
                professorID: controller.selectedProfessorId!,
                period: int.parse(controller.selectedPeriodName!),
                classDays: controller.chosenClassDays,
                classTime: controller.chosenClassTime,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(
                message: 'Disciplina atualizada com sucesso!',
                color: Colors.blue,
              ),
            );
            Modular.to.pop();
          }
        },
        text: 'Atualizar',
      );
}
