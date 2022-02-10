import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';

class UserRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  void add({required UserModel user}) =>
      collection.doc(user.id).set(user.toMap());

  void update(
          {required String documentID, required UserModel user}) =>
      collection.doc(documentID).update(user.toMap());

  void delete({required String documentID}) =>
      collection.doc(documentID).delete();

  Stream<List<UserModel>> get() {
    return collection.orderBy('name').snapshots().map((query) =>
        query.docs.map((doc) => UserModel.fromMap(doc)).toList());
  }
}
