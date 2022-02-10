import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/subject_model.dart';

class SubjectRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('subjects');

  void add({required SubjectModel subject}) =>
      collection.add(subject.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update({required String documentID, required SubjectModel subject}) =>
      collection.doc(documentID).update(subject.toMap());

  void delete({required String documentID}) => collection.doc(documentID).delete();

  Stream<List<SubjectModel>> get() {
    return collection.orderBy('name').snapshots().map(
        (query) => query.docs.map((doc) => SubjectModel.fromMap(doc)).toList());
  }
}
