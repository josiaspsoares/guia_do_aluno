import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/modules/professors/repositories/professor_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_day_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_time_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/modality_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/period_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/class_day_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/class_time_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/modality_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/period_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/subject_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'subject_controller.g.dart';

class SubjectController = _SubjectControllerBase with _$SubjectController;

abstract class _SubjectControllerBase with Store {
  final _repository = Modular.get<SubjectRepository>();
  final _classDayRepository = Modular.get<ClassDayRepository>();
  final _classTimeRepository = Modular.get<ClassTimeRepository>();
  final _modalityRepository = Modular.get<ModalityRepository>();
  final _periodRepository = Modular.get<PeriodRepository>();
  final _professorRepository = Modular.get<ProfessorRepository>();

  _SubjectControllerBase() {
    getUserRole();
    getSubjects();
    getClassDays();
    getClassTime();
    getModalities();
    getPeriods();
    getProfessors();
  }

  @observable
  TextEditingController subjectNameController = TextEditingController();

  @observable
  TextEditingController remoteClassLinkController = TextEditingController();

  @observable
  TextEditingController recordedLessonsLinkController = TextEditingController();

  @observable
  String? userRole;

  @observable
  String? selectedProfessorId;

  @observable
  String? selectedModalityName;

  @observable
  String? selectedPeriodName;

  @observable
  String? selectedClassDay;

  @observable
  String? selectedClassTime;

  @observable
  bool isClassDaySelected = false;

  @observable
  List<String> chosenClassDays = [];

  @observable
  List<String> chosenClassTime = [];

  @observable
  ObservableStream<List<SubjectModel>>? subjects;

  @observable
  ObservableStream<List<ClassDayModel>>? classDays;

  @observable
  ObservableStream<List<ClassTimeModel>>? classTime;

  @observable
  ObservableStream<List<ModalityModel>>? modalities;

  @observable
  ObservableStream<List<PeriodModel>>? periods;

  @observable
  ObservableStream<List<ProfessorModel>>? professors;

  @action
  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
  }

  @action
  void getSubjects() {
    subjects = _repository.get().asObservable();
  }

  @action
  void getClassDays() {
    classDays = _classDayRepository.get().asObservable();
  }

  @action
  void getClassTime() {
    classTime = _classTimeRepository.get().asObservable();
  }

  @action
  void getModalities() {
    modalities = _modalityRepository.get().asObservable();
  }

  @action
  void getPeriods() {
    periods = _periodRepository.get().asObservable();
  }

  @action
  void getProfessors() {
    professors = _professorRepository.get().asObservable();
  }

  @action
  void add({required SubjectModel subject}) {
    _repository.add(subject: subject);
  }

  @action
  void update({required String documentID, required SubjectModel subject}) {
    _repository.update(documentID: documentID, subject: subject);
  }

  @action
  void delete({required String documentID}) {
    _repository.delete(documentID: documentID);
  }

  @action
  bool isProfessorIDValid({required String? id}) {
    List<ProfessorModel> list = professors!.data;

    for (var element in list) {
      if (element.id == id) {
        return true;
      }
    }

    return false;
  }
}
