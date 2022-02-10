import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/courseware/models/courseware_model.dart';
import 'package:guia_do_aluno/app/modules/courseware/repositories/courseware_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/subject_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'courseware_controller.g.dart';

class CoursewareController = _CoursewareControllerBase
    with _$CoursewareController;

abstract class _CoursewareControllerBase with Store {
  final _repository = Modular.get<CoursewareRepository>();
  final _subjectRepository = Modular.get<SubjectRepository>();

  _CoursewareControllerBase() {
    getUserRole();
    getCousewares(subjectId);
    getSubjects();
  }

  @observable
  String? userRole;

  @observable
  String? subjectId;

  @observable
  String? selectedSubjectId;

  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  TextEditingController linkController = TextEditingController();

  @observable
  ObservableStream<List<CoursewareModel>>? coursewares;

  @observable
  ObservableStream<List<SubjectModel>>? subjects;

  @action
  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
  }

  @action
  void getCousewares([String? subjectID]) {
    coursewares = _repository.get(subjectID).asObservable();
  }

  @action
  void getSubjects() {
    subjects = _subjectRepository.get().asObservable();
  }

  @action
  void add({required CoursewareModel courseware}) {
    _repository.add(courseware: courseware);
  }

  @action
  void update(
      {required String documentID, required CoursewareModel courseware}) {
    _repository.update(documentID: documentID, courseware: courseware);
  }

  @action
  void delete({required String documentID}) {
    _repository.delete(documentID: documentID);
  }

  @action
  bool isSubjectIDValid({required String? id}) {
    List<SubjectModel> list = subjects!.data;

    for (var element in list) {
      if (element.id == id) {
        return true;
      }
    }

    return false;
  }
}
