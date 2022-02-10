import 'package:firebase_auth/firebase_auth.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';

abstract class AuthRepository {
  Future<void> signInWithGoogle();
  Future<void> webSignInWithGoogle();
  Future<void> deleteUser();
  Future<void> signOut();
  String currentUserUID();
  User? currentUserObject();
  Future<UserModel?> getCurrentUserObject({required String userID});
}
