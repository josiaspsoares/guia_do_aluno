// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courseware_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoursewareController on _CoursewareControllerBase, Store {
  final _$userRoleAtom = Atom(name: '_CoursewareControllerBase.userRole');

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

  final _$subjectIdAtom = Atom(name: '_CoursewareControllerBase.subjectId');

  @override
  String? get subjectId {
    _$subjectIdAtom.reportRead();
    return super.subjectId;
  }

  @override
  set subjectId(String? value) {
    _$subjectIdAtom.reportWrite(value, super.subjectId, () {
      super.subjectId = value;
    });
  }

  final _$selectedSubjectIdAtom =
      Atom(name: '_CoursewareControllerBase.selectedSubjectId');

  @override
  String? get selectedSubjectId {
    _$selectedSubjectIdAtom.reportRead();
    return super.selectedSubjectId;
  }

  @override
  set selectedSubjectId(String? value) {
    _$selectedSubjectIdAtom.reportWrite(value, super.selectedSubjectId, () {
      super.selectedSubjectId = value;
    });
  }

  final _$titleControllerAtom =
      Atom(name: '_CoursewareControllerBase.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$descriptionControllerAtom =
      Atom(name: '_CoursewareControllerBase.descriptionController');

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  final _$linkControllerAtom =
      Atom(name: '_CoursewareControllerBase.linkController');

  @override
  TextEditingController get linkController {
    _$linkControllerAtom.reportRead();
    return super.linkController;
  }

  @override
  set linkController(TextEditingController value) {
    _$linkControllerAtom.reportWrite(value, super.linkController, () {
      super.linkController = value;
    });
  }

  final _$coursewaresAtom = Atom(name: '_CoursewareControllerBase.coursewares');

  @override
  ObservableStream<List<CoursewareModel>>? get coursewares {
    _$coursewaresAtom.reportRead();
    return super.coursewares;
  }

  @override
  set coursewares(ObservableStream<List<CoursewareModel>>? value) {
    _$coursewaresAtom.reportWrite(value, super.coursewares, () {
      super.coursewares = value;
    });
  }

  final _$subjectsAtom = Atom(name: '_CoursewareControllerBase.subjects');

  @override
  ObservableStream<List<SubjectModel>>? get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(ObservableStream<List<SubjectModel>>? value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$getUserRoleAsyncAction =
      AsyncAction('_CoursewareControllerBase.getUserRole');

  @override
  Future<void> getUserRole() {
    return _$getUserRoleAsyncAction.run(() => super.getUserRole());
  }

  final _$_CoursewareControllerBaseActionController =
      ActionController(name: '_CoursewareControllerBase');

  @override
  void getCousewares([String? subjectID]) {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.getCousewares');
    try {
      return super.getCousewares(subjectID);
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSubjects() {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.getSubjects');
    try {
      return super.getSubjects();
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add({required CoursewareModel courseware}) {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.add');
    try {
      return super.add(courseware: courseware);
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(
      {required String documentID, required CoursewareModel courseware}) {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.update');
    try {
      return super.update(documentID: documentID, courseware: courseware);
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete({required String documentID}) {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.delete');
    try {
      return super.delete(documentID: documentID);
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isSubjectIDValid({required String? id}) {
    final _$actionInfo = _$_CoursewareControllerBaseActionController
        .startAction(name: '_CoursewareControllerBase.isSubjectIDValid');
    try {
      return super.isSubjectIDValid(id: id);
    } finally {
      _$_CoursewareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userRole: ${userRole},
subjectId: ${subjectId},
selectedSubjectId: ${selectedSubjectId},
titleController: ${titleController},
descriptionController: ${descriptionController},
linkController: ${linkController},
coursewares: ${coursewares},
subjects: ${subjects}
    ''';
  }
}
