import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:guia_do_aluno/app/modules/auth/errors/auth_exception.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/modules/auth/repositories/firebase_auth_repository.dart';
import 'package:guia_do_aluno/app/shared/models/generic_error_model/generic_error_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final repository = Modular.get<FirebaseAuthRepository>();

  _AuthControllerBase() {
    getAuthStatus();
    getUserData();
  }

  @observable
  bool loading = false;

  @observable
  Exception? error;

  @observable
  UserModel? user;

  @observable
  bool? isLoggedIn;

  @action
  Future<void> getAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('auth');
  }

  @action
  Future<void> getUserData() async {
    loading = true;
    FirebaseAuth.instance.userChanges().listen((User? currenUser) async {
      if (currenUser == null) {
        loading = false;
      } else {
        try {
          await repository.getCurrentUserObject(userID: currenUser.uid).then((value) async {
            user = value;

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('name', user!.name);
            await prefs.setString('id', user!.id);
            await prefs.setString('avatarUrl', user!.avatarUrl);
            await prefs.setString('email', user!.email);
            await prefs.setString('role', user!.role);

            await FirebaseMessaging.instance.subscribeToTopic('auth');

            loading = false;
          });
        } catch (e) {
          Modular.to.navigate(
            '/erro',
            arguments: GenericErrorModel(
              title: 'Acesso Negado',
              message: 'Para acessar esse recurso, você deve fazer login com seu endereço de email institucional',
              hasButton: true,
              buttonText: 'Realizar Login',
              buttonAction: () {
                Modular.to.pushReplacementNamed('/');
              },
            ),
          );
        }
      }
    });
  }

  @action
  Future<void> signInWithGoogle() async {
    loading = true;

    try {
      if (kIsWeb) {
        await repository.webSignInWithGoogle();
      } else {
        await repository.signInWithGoogle();
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
    } on AuthException catch (e) {
      Modular.to.navigate(
        '/erro',
        arguments: GenericErrorModel(
          title: 'Acesso Negado',
          message: e.message,
          hasButton: true,
          buttonText: 'Realizar Login',
          buttonAction: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      Modular.to.navigate(
        '/erro',
        arguments: GenericErrorModel(
          title: 'Login Abortado',
          message: e.message!,
          hasButton: true,
          buttonText: 'Realizar Login',
          buttonAction: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      );
    } catch (e) {
      Modular.to.navigate(
        '/erro',
        arguments: GenericErrorModel(
          title: 'Ops!',
          message: 'Falha ao realizar login, verifique sua conexão com a internet. Caso o problema persista, entre em contato conosco',
          hasButton: true,
          buttonText: 'Tentar Novamente',
          buttonAction: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      );
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> signOut() async {
    loading = true;

    try {
      await repository.signOut().then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', false);
        await prefs.remove('name');
        await prefs.remove('id');
        await prefs.remove('avatarUrl');
        await prefs.remove('email');
        await prefs.remove('role');

        await FirebaseMessaging.instance.unsubscribeFromTopic('auth');

        Modular.to.pushReplacementNamed('/');
      });
    } catch (e) {
      Modular.to.navigate(
        '/erro',
        arguments: GenericErrorModel(
          title: 'Ops!',
          message: e.toString(),
          hasButton: true,
          buttonText: 'Tentar Novamente',
          buttonAction: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      );
    } finally {
      loading = false;
    }
  }
}
