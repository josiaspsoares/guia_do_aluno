import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';
import 'package:guia_do_aluno/app/modules/professors/repositories/professor_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'professors_controller.g.dart';

class ProfessorsController = _ProfessorsControllerBase
    with _$ProfessorsController;

abstract class _ProfessorsControllerBase with Store {
  final _repository = Modular.get<ProfessorRepository>();

  _ProfessorsControllerBase() {
    getUserRole();
    getProfessors();
  }

  @observable
  TextEditingController professorNameController = TextEditingController();

  @observable
  TextEditingController professorEmailController = TextEditingController();

  @observable
  TextEditingController professorPhoneController = TextEditingController();

  @observable
  ObservableStream<List<ProfessorModel>>? professors;

  @observable
  String? userRole;

  @action
  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
  }

  @action
  void getProfessors() {
    professors = _repository.get().asObservable();
  }

  @action
  void add({required ProfessorModel professor}) {
    _repository.add(professor: professor);
  }

  @action
  void update({required String documentID, required ProfessorModel professor}) {
    _repository.update(documentID: documentID, professor: professor);
  }

  @action
  void delete({required String documentID}) {
    _repository.delete(documentID: documentID);
  }
}
