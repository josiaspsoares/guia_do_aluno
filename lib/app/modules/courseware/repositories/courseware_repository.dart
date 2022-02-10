import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/courseware/models/courseware_model.dart';

class CoursewareRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('courseware');

  void add({required CoursewareModel courseware}) =>
      collection.add(courseware.toMap()).then((value) {
        collection.doc(value.id).update({'id': value.id});
      });

  void update(
          {required String documentID, required CoursewareModel courseware}) =>
      collection.doc(documentID).update(courseware.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<CoursewareModel>> get([String? subjectID]) {
    if(subjectID != null){
      return collection
          .where('subjectID', isEqualTo: subjectID)    
          .snapshots()
          .map((query) =>
              query.docs.map((doc) => CoursewareModel.fromMap(doc)).toList());
    }

    return collection.orderBy('title').snapshots().map((query) =>
        query.docs.map((doc) => CoursewareModel.fromMap(doc)).toList());
  }
}
