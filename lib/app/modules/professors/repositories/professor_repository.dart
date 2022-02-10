import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/professors/models/professor_model.dart';

class ProfessorRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('professors');

  void add({required ProfessorModel professor}) =>
      collection.add(professor.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update(
          {required String documentID, required ProfessorModel professor}) =>
      collection.doc(documentID).update(professor.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<ProfessorModel>> get() {
    return collection.orderBy('name').snapshots().map((query) =>
        query.docs.map((doc) => ProfessorModel.fromMap(doc)).toList());
  }
}
