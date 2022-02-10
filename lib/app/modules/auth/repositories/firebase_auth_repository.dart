import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guia_do_aluno/app/modules/auth/errors/auth_exception.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/modules/auth/repositories/auth_repository.dart';
import 'package:guia_do_aluno/app/modules/auth/repositories/user_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user!.email!.contains('@doctum.edu.br')) {
          await getCurrentUserObject(userID: userCredential.user!.uid)
              .then((value) {
            if (value == null) {
              UserRepository().add(
                  user: UserModel(
                id: userCredential.user!.uid,
                name: userCredential.user!.displayName ?? '',
                email: userCredential.user!.email ?? '',
                avatarUrl: userCredential.user!.photoURL ?? '',
                role: 'student',
              ));
              signInWithGoogle();
            }
          });
        } else {
          await deleteUser();
          await signOut();
          throw AuthException(
              message:
                  'Para acessar esse recurso, você deve fazer login com seu endereço de email institucional');
        }
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google ID Token');
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message:
            'O login foi interrompido. Se você deseja realizá-lo novamente, clique no botão abaixo',
      );
    }
  }

  @override
  Future<void> webSignInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

    if(userCredential.user != null){
      if (userCredential.user!.email!.contains('@doctum.edu.br')) {
        await getCurrentUserObject(userID: userCredential.user!.uid)
            .then((value) {
          if (value == null) {
            UserRepository().add(
                user: UserModel(
              id: userCredential.user!.uid,
              name: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '',
              avatarUrl: userCredential.user!.photoURL ?? '',
              role: 'student',
            ));
            webSignInWithGoogle();
          }
        });
      } else {
        await deleteUser();
        await signOut();
        throw AuthException(
            message:
                'Para acessar esse recurso, você deve fazer login com seu endereço de email institucional');
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message:
            'O login foi interrompido. Se você deseja realizá-lo novamente, clique no botão abaixo',
      );
    }

    
  }

  @override
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  String currentUserUID() {
    User? user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  @override
  User? currentUserObject() {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  @override
  Future<UserModel?> getCurrentUserObject({required String userID}) async {
    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection("users").doc(userID).get();

    if (document.exists) {
      return UserModel.fromMap(document);
    } else {
      return null;
    }
  }
}
