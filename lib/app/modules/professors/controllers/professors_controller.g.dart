// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professors_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfessorsController on _ProfessorsControllerBase, Store {
  final _$professorNameControllerAtom =
      Atom(name: '_ProfessorsControllerBase.professorNameController');

  @override
  TextEditingController get professorNameController {
    _$professorNameControllerAtom.reportRead();
    return super.professorNameController;
  }

  @override
  set professorNameController(TextEditingController value) {
    _$professorNameControllerAtom
        .reportWrite(value, super.professorNameController, () {
      super.professorNameController = value;
    });
  }

  final _$professorEmailControllerAtom =
      Atom(name: '_ProfessorsControllerBase.professorEmailController');

  @override
  TextEditingController get professorEmailController {
    _$professorEmailControllerAtom.reportRead();
    return super.professorEmailController;
  }

  @override
  set professorEmailController(TextEditingController value) {
    _$professorEmailControllerAtom
        .reportWrite(value, super.professorEmailController, () {
      super.professorEmailController = value;
    });
  }

  final _$professorPhoneControllerAtom =
      Atom(name: '_ProfessorsControllerBase.professorPhoneController');

  @override
  TextEditingController get professorPhoneController {
    _$professorPhoneControllerAtom.reportRead();
    return super.professorPhoneController;
  }

  @override
  set professorPhoneController(TextEditingController value) {
    _$professorPhoneControllerAtom
        .reportWrite(value, super.professorPhoneController, () {
      super.professorPhoneController = value;
    });
  }

  final _$professorsAtom = Atom(name: '_ProfessorsControllerBase.professors');

  @override
  ObservableStream<List<ProfessorModel>>? get professors {
    _$professorsAtom.reportRead();
    return super.professors;
  }

  @override
  set professors(ObservableStream<List<ProfessorModel>>? value) {
    _$professorsAtom.reportWrite(value, super.professors, () {
      super.professors = value;
    });
  }

  final _$userRoleAtom = Atom(name: '_ProfessorsControllerBase.userRole');

  @override
  String? get userRole {
    _$userRoleAtom.reportRead();
    return super.userRole;
  }

  @override
  set userRole(String? value) {
    _$userRoleAtom.reportWrite(value, super.userRole, () {
      super.userRole = value;
    });
  }

  final _$getUserRoleAsyncAction =
      AsyncAction('_ProfessorsControllerBase.getUserRole');

  @override
  Future<void> getUserRole() {
    return _$getUserRoleAsyncAction.run(() => super.getUserRole());
  }

  final _$_ProfessorsControllerBaseActionController =
      ActionController(name: '_ProfessorsControllerBase');

  @override
  void getProfessors() {
    final _$actionInfo = _$_ProfessorsControllerBaseActionController
        .startAction(name: '_ProfessorsControllerBase.getProfessors');
    try {
      return super.getProfessors();
    } finally {
      _$_ProfessorsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add({required ProfessorModel professor}) {
    final _$actionInfo = _$_ProfessorsControllerBaseActionController
        .startAction(name: '_ProfessorsControllerBase.add');
    try {
      return super.add(professor: professor);
    } finally {
      _$_ProfessorsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update({required String documentID, required ProfessorModel professor}) {
    final _$actionInfo = _$_ProfessorsControllerBaseActionController
        .startAction(name: '_ProfessorsControllerBase.update');
    try {
      return super.update(documentID: documentID, professor: professor);
    } finally {
      _$_ProfessorsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete({required String documentID}) {
    final _$actionInfo = _$_ProfessorsControllerBaseActionController
        .startAction(name: '_ProfessorsControllerBase.delete');
    try {
      return super.delete(documentID: documentID);
    } finally {
      _$_ProfessorsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
professorNameController: ${professorNameController},
professorEmailController: ${professorEmailController},
professorPhoneController: ${professorPhoneController},
professors: ${professors},
userRole: ${userRole}
    ''';
  }
}
