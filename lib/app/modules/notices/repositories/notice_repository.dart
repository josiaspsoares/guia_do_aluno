import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/notices/models/notice_model.dart';

class NoticeRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('notices');

  void add({required NoticeModel notice}) =>
      collection.add(notice.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update(
          {required String documentID, required NoticeModel notice}) =>
      collection.doc(documentID).update(notice.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<NoticeModel>> get() {
    return collection.orderBy('sendDate', descending: true).snapshots().map((query) =>
        query.docs.map((doc) => NoticeModel.fromMap(doc)).toList());
  }
}
