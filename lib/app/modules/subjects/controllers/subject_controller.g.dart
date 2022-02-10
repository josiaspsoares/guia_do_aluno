// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectController on _SubjectControllerBase, Store {
  final _$subjectNameControllerAtom =
      Atom(name: '_SubjectControllerBase.subjectNameController');

  @override
  TextEditingController get subjectNameController {
    _$subjectNameControllerAtom.reportRead();
    return super.subjectNameController;
  }

  @override
  set subjectNameController(TextEditingController value) {
    _$subjectNameControllerAtom.reportWrite(value, super.subjectNameController,
        () {
      super.subjectNameController = value;
    });
  }

  final _$remoteClassLinkControllerAtom =
      Atom(name: '_SubjectControllerBase.remoteClassLinkController');

  @override
  TextEditingController get remoteClassLinkController {
    _$remoteClassLinkControllerAtom.reportRead();
    return super.remoteClassLinkController;
  }

  @override
  set remoteClassLinkController(TextEditingController value) {
    _$remoteClassLinkControllerAtom
        .reportWrite(value, super.remoteClassLinkController, () {
      super.remoteClassLinkController = value;
    });
  }

  final _$recordedLessonsLinkControllerAtom =
      Atom(name: '_SubjectControllerBase.recordedLessonsLinkController');

  @override
  TextEditingController get recordedLessonsLinkController {
    _$recordedLessonsLinkControllerAtom.reportRead();
    return super.recordedLessonsLinkController;
  }

  @override
  set recordedLessonsLinkController(TextEditingController value) {
    _$recordedLessonsLinkControllerAtom
        .reportWrite(value, super.recordedLessonsLinkController, () {
      super.recordedLessonsLinkController = value;
    });
  }

  final _$userRoleAtom = Atom(name: '_SubjectControllerBase.userRole');

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

  final _$selectedProfessorIdAtom =
      Atom(name: '_SubjectControllerBase.selectedProfessorId');

  @override
  String? get selectedProfessorId {
    _$selectedProfessorIdAtom.reportRead();
    return super.selectedProfessorId;
  }

  @override
  set selectedProfessorId(String? value) {
    _$selectedProfessorIdAtom.reportWrite(value, super.selectedProfessorId, () {
      super.selectedProfessorId = value;
    });
  }

  final _$selectedModalityNameAtom =
      Atom(name: '_SubjectControllerBase.selectedModalityName');

  @override
  String? get selectedModalityName {
    _$selectedModalityNameAtom.reportRead();
    return super.selectedModalityName;
  }

  @override
  set selectedModalityName(String? value) {
    _$selectedModalityNameAtom.reportWrite(value, super.selectedModalityName,
        () {
      super.selectedModalityName = value;
    });
  }

  final _$selectedPeriodNameAtom =
      Atom(name: '_SubjectControllerBase.selectedPeriodName');

  @override
  String? get selectedPeriodName {
    _$selectedPeriodNameAtom.reportRead();
    return super.selectedPeriodName;
  }

  @override
  set selectedPeriodName(String? value) {
    _$selectedPeriodNameAtom.reportWrite(value, super.selectedPeriodName, () {
      super.selectedPeriodName = value;
    });
  }

  final _$selectedClassDayAtom =
      Atom(name: '_SubjectControllerBase.selectedClassDay');

  @override
  String? get selectedClassDay {
    _$selectedClassDayAtom.reportRead();
    return super.selectedClassDay;
  }

  @override
  set selectedClassDay(String? value) {
    _$selectedClassDayAtom.reportWrite(value, super.selectedClassDay, () {
      super.selectedClassDay = value;
    });
  }

  final _$selectedClassTimeAtom =
      Atom(name: '_SubjectControllerBase.selectedClassTime');

  @override
  String? get selectedClassTime {
    _$selectedClassTimeAtom.reportRead();
    return super.selectedClassTime;
  }

  @override
  set selectedClassTime(String? value) {
    _$selectedClassTimeAtom.reportWrite(value, super.selectedClassTime, () {
      super.selectedClassTime = value;
    });
  }

  final _$isClassDaySelectedAtom =
      Atom(name: '_SubjectControllerBase.isClassDaySelected');

  @override
  bool get isClassDaySelected {
    _$isClassDaySelectedAtom.reportRead();
    return super.isClassDaySelected;
  }

  @override
  set isClassDaySelected(bool value) {
    _$isClassDaySelectedAtom.reportWrite(value, super.isClassDaySelected, () {
      super.isClassDaySelected = value;
    });
  }

  final _$chosenClassDaysAtom =
      Atom(name: '_SubjectControllerBase.chosenClassDays');

  @override
  List<String> get chosenClassDays {
    _$chosenClassDaysAtom.reportRead();
    return super.chosenClassDays;
  }

  @override
  set chosenClassDays(List<String> value) {
    _$chosenClassDaysAtom.reportWrite(value, super.chosenClassDays, () {
      super.chosenClassDays = value;
    });
  }

  final _$chosenClassTimeAtom =
      Atom(name: '_SubjectControllerBase.chosenClassTime');

  @override
  List<String> get chosenClassTime {
    _$chosenClassTimeAtom.reportRead();
    return super.chosenClassTime;
  }

  @override
  set chosenClassTime(List<String> value) {
    _$chosenClassTimeAtom.reportWrite(value, super.chosenClassTime, () {
      super.chosenClassTime = value;
    });
  }

  final _$subjectsAtom = Atom(name: '_SubjectControllerBase.subjects');

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

  final _$classDaysAtom = Atom(name: '_SubjectControllerBase.classDays');

  @override
  ObservableStream<List<ClassDayModel>>? get classDays {
    _$classDaysAtom.reportRead();
    return super.classDays;
  }

  @override
  set classDays(ObservableStream<List<ClassDayModel>>? value) {
    _$classDaysAtom.reportWrite(value, super.classDays, () {
      super.classDays = value;
    });
  }

  final _$classTimeAtom = Atom(name: '_SubjectControllerBase.classTime');

  @override
  ObservableStream<List<ClassTimeModel>>? get classTime {
    _$classTimeAtom.reportRead();
    return super.classTime;
  }

  @override
  set classTime(ObservableStream<List<ClassTimeModel>>? value) {
    _$classTimeAtom.reportWrite(value, super.classTime, () {
      super.classTime = value;
    });
  }

  final _$modalitiesAtom = Atom(name: '_SubjectControllerBase.modalities');

  @override
  ObservableStream<List<ModalityModel>>? get modalities {
    _$modalitiesAtom.reportRead();
    return super.modalities;
  }

  @override
  set modalities(ObservableStream<List<ModalityModel>>? value) {
    _$modalitiesAtom.reportWrite(value, super.modalities, () {
      super.modalities = value;
    });
  }

  final _$periodsAtom = Atom(name: '_SubjectControllerBase.periods');

  @override
  ObservableStream<List<PeriodModel>>? get periods {
    _$periodsAtom.reportRead();
    return super.periods;
  }

  @override
  set periods(ObservableStream<List<PeriodModel>>? value) {
    _$periodsAtom.reportWrite(value, super.periods, () {
      super.periods = value;
    });
  }

  final _$professorsAtom = Atom(name: '_SubjectControllerBase.professors');

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

  final _$getUserRoleAsyncAction =
      AsyncAction('_SubjectControllerBase.getUserRole');

  @override
  Future<void> getUserRole() {
    return _$getUserRoleAsyncAction.run(() => super.getUserRole());
  }

  final _$_SubjectControllerBaseActionController =
      ActionController(name: '_SubjectControllerBase');

  @override
  void getSubjects() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getSubjects');
    try {
      return super.getSubjects();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getClassDays() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getClassDays');
    try {
      return super.getClassDays();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getClassTime() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getClassTime');
    try {
      return super.getClassTime();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getModalities() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getModalities');
    try {
      return super.getModalities();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPeriods() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getPeriods');
    try {
      return super.getPeriods();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getProfessors() {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.getProfessors');
    try {
      return super.getProfessors();
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add({required SubjectModel subject}) {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.add');
    try {
      return super.add(subject: subject);
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update({required String documentID, required SubjectModel subject}) {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.update');
    try {
      return super.update(documentID: documentID, subject: subject);
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete({required String documentID}) {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.delete');
    try {
      return super.delete(documentID: documentID);
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isProfessorIDValid({required String? id}) {
    final _$actionInfo = _$_SubjectControllerBaseActionController.startAction(
        name: '_SubjectControllerBase.isProfessorIDValid');
    try {
      return super.isProfessorIDValid(id: id);
    } finally {
      _$_SubjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjectNameController: ${subjectNameController},
remoteClassLinkController: ${remoteClassLinkController},
recordedLessonsLinkController: ${recordedLessonsLinkController},
userRole: ${userRole},
selectedProfessorId: ${selectedProfessorId},
selectedModalityName: ${selectedModalityName},
selectedPeriodName: ${selectedPeriodName},
selectedClassDay: ${selectedClassDay},
selectedClassTime: ${selectedClassTime},
isClassDaySelected: ${isClassDaySelected},
chosenClassDays: ${chosenClassDays},
chosenClassTime: ${chosenClassTime},
subjects: ${subjects},
classDays: ${classDays},
classTime: ${classTime},
modalities: ${modalities},
periods: ${periods},
professors: ${professors}
    ''';
  }
}
