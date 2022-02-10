import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/notices/models/notice_model.dart';
import 'package:guia_do_aluno/app/modules/notices/repositories/notice_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'notice_controller.g.dart';

class NoticeController = _NoticeControllerBase
    with _$NoticeController;

abstract class _NoticeControllerBase with Store {
  final _repository = Modular.get<NoticeRepository>();

  _NoticeControllerBase() {
    getUserRole();
    getUserID();
    getNotices();
  }

  @observable
  TextEditingController noticeTitleController = TextEditingController();

  @observable
  TextEditingController noticeDescriptionController = TextEditingController();

  @observable
  TextEditingController noticeLinkController = TextEditingController();

  @observable
  String? userRole;

  @observable
  String? userID;

  @observable
  ObservableStream<List<NoticeModel>>? notices;

  @action
  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
  }

  @action
  Future<void> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('id');
  }

  @action
  void  getNotices() {
    notices = _repository.get().asObservable();
  }

  @action
  void add({required NoticeModel notice}) {
    _repository.add(notice: notice);
  }

  @action
  void update({required String documentID, required NoticeModel notice}) {
    _repository.update(documentID: documentID, notice: notice);
  }

  @action
  void delete({required String documentID}) {
    _repository.delete(documentID: documentID);
  }
}
