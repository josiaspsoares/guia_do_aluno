import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/subjects/models/modality_model.dart';

class ModalityRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('course/1/modalities');

  void add({required ModalityModel modality}) =>
      collection.add(modality.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update(
          {required String documentID, required ModalityModel modality}) =>
      collection.doc(documentID).update(modality.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<ModalityModel>> get() {
    return collection.orderBy('name').snapshots().map((query) =>
        query.docs.map((doc) => ModalityModel.fromMap(doc)).toList());
  }
}
