import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/auth/auth_module.dart';
import 'package:guia_do_aluno/app/modules/auth/controllers/auth_controller.dart';
import 'package:guia_do_aluno/app/modules/auth/repositories/firebase_auth_repository.dart';
import 'package:guia_do_aluno/app/modules/auth/repositories/user_repository.dart';
import 'package:guia_do_aluno/app/modules/courseware/courseware_module.dart';
import 'package:guia_do_aluno/app/modules/home/controllers/home_controller.dart';
import 'package:guia_do_aluno/app/modules/home/home_module.dart';
import 'package:guia_do_aluno/app/modules/notices/notices_module.dart';
import 'package:guia_do_aluno/app/modules/professors/professors_module.dart';
import 'package:guia_do_aluno/app/modules/subjects/subject_module.dart';
import 'package:guia_do_aluno/app/shared/widgets/generic_error_widget/generic_error_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? auth = prefs.getBool('auth');

    if (auth == true) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => '/';
}

class RoleGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? auth = prefs.getBool('auth');
    String? role = prefs.getString('role');

    if (auth == true &&
        (role == "professor" || role == "admin" || role == "leader")) {
      if (role == "leader" && !url.contains('avisos')) {
        return Future.value(false);
      }
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => '/home';
}


class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FirebaseAuthRepository()),
    Bind.lazySingleton((i) => UserRepository()),
    Bind.lazySingleton((i) => AuthController()),
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ChildRoute('/erro',
        child: (_, args) => GenericErrorWidget(error: args.data)),
         ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/disciplinas', module: SubjectsModule()),
    ModuleRoute('/professores', module: ProfessorsModule()),
    ModuleRoute('/materiais', module: CoursewareModule()),
    ModuleRoute('/avisos', module: NoticesModule()),
  ];
}
