import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/class_time_model.dart';

class ClassTimeRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('course/1/class_time');

  void add({required ClassTimeModel classTime}) =>
      collection.add(classTime.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update({required String documentID, required ClassTimeModel classTime}) =>
      collection.doc(documentID).update(classTime.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<ClassTimeModel>> get() {
    return collection.orderBy('name').snapshots().map((query) =>
        query.docs.map((doc) => ClassTimeModel.fromMap(doc)).toList());
  }
}