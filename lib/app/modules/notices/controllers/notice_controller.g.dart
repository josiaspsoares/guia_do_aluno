// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoticeController on _NoticeControllerBase, Store {
  final _$noticeTitleControllerAtom =
      Atom(name: '_NoticeControllerBase.noticeTitleController');

  @override
  TextEditingController get noticeTitleController {
    _$noticeTitleControllerAtom.reportRead();
    return super.noticeTitleController;
  }

  @override
  set noticeTitleController(TextEditingController value) {
    _$noticeTitleControllerAtom.reportWrite(value, super.noticeTitleController,
        () {
      super.noticeTitleController = value;
    });
  }

  final _$noticeDescriptionControllerAtom =
      Atom(name: '_NoticeControllerBase.noticeDescriptionController');

  @override
  TextEditingController get noticeDescriptionController {
    _$noticeDescriptionControllerAtom.reportRead();
    return super.noticeDescriptionController;
  }

  @override
  set noticeDescriptionController(TextEditingController value) {
    _$noticeDescriptionControllerAtom
        .reportWrite(value, super.noticeDescriptionController, () {
      super.noticeDescriptionController = value;
    });
  }

  final _$noticeLinkControllerAtom =
      Atom(name: '_NoticeControllerBase.noticeLinkController');

  @override
  TextEditingController get noticeLinkController {
    _$noticeLinkControllerAtom.reportRead();
    return super.noticeLinkController;
  }

  @override
  set noticeLinkController(TextEditingController value) {
    _$noticeLinkControllerAtom.reportWrite(value, super.noticeLinkController,
        () {
      super.noticeLinkController = value;
    });
  }

  final _$userRoleAtom = Atom(name: '_NoticeControllerBase.userRole');

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

  final _$userIDAtom = Atom(name: '_NoticeControllerBase.userID');

  @override
  String? get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(String? value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  final _$noticesAtom = Atom(name: '_NoticeControllerBase.notices');

  @override
  ObservableStream<List<NoticeModel>>? get notices {
    _$noticesAtom.reportRead();
    return super.notices;
  }

  @override
  set notices(ObservableStream<List<NoticeModel>>? value) {
    _$noticesAtom.reportWrite(value, super.notices, () {
      super.notices = value;
    });
  }

  final _$getUserRoleAsyncAction =
      AsyncAction('_NoticeControllerBase.getUserRole');

  @override
  Future<void> getUserRole() {
    return _$getUserRoleAsyncAction.run(() => super.getUserRole());
  }

  final _$getUserIDAsyncAction = AsyncAction('_NoticeControllerBase.getUserID');

  @override
  Future<void> getUserID() {
    return _$getUserIDAsyncAction.run(() => super.getUserID());
  }

  final _$_NoticeControllerBaseActionController =
      ActionController(name: '_NoticeControllerBase');

  @override
  void getNotices() {
    final _$actionInfo = _$_NoticeControllerBaseActionController.startAction(
        name: '_NoticeControllerBase.getNotices');
    try {
      return super.getNotices();
    } finally {
      _$_NoticeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add({required NoticeModel notice}) {
    final _$actionInfo = _$_NoticeControllerBaseActionController.startAction(
        name: '_NoticeControllerBase.add');
    try {
      return super.add(notice: notice);
    } finally {
      _$_NoticeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update({required String documentID, required NoticeModel notice}) {
    final _$actionInfo = _$_NoticeControllerBaseActionController.startAction(
        name: '_NoticeControllerBase.update');
    try {
      return super.update(documentID: documentID, notice: notice);
    } finally {
      _$_NoticeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete({required String documentID}) {
    final _$actionInfo = _$_NoticeControllerBaseActionController.startAction(
        name: '_NoticeControllerBase.delete');
    try {
      return super.delete(documentID: documentID);
    } finally {
      _$_NoticeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
noticeTitleController: ${noticeTitleController},
noticeDescriptionController: ${noticeDescriptionController},
noticeLinkController: ${noticeLinkController},
userRole: ${userRole},
userID: ${userID},
notices: ${notices}
    ''';
  }
}
