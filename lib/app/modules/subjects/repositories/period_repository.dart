import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/period_model.dart';

class PeriodRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('course/1/periods');

  void add({required PeriodModel period}) =>
      collection.add(period.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update({required String documentID, required PeriodModel period}) =>
      collection.doc(documentID).update(period.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<PeriodModel>> get() {
    return collection.orderBy('name').snapshots().map((query) =>
        query.docs.map((doc) => PeriodModel.fromMap(doc)).toList());
  }
}
