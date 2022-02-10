import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_day_model.dart';

class ClassDayRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('course/1/class_days');

  void add({required ClassDayModel classDay}) =>
      collection.add(classDay.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update({required String documentID, required ClassDayModel classDay}) =>
      collection.doc(documentID).update(classDay.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<ClassDayModel>> get() {
    return collection.orderBy('id').snapshots().map(
        (query) => query.docs.map((doc) => ClassDayModel.fromMap(doc)).toList());
  }
}
