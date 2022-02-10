import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/app_module.dart';
import 'package:guia_do_aluno/app/modules/professors/controllers/professors_controller.dart';
import 'package:guia_do_aluno/app/modules/professors/pages/professor_registration_page.dart';
import 'package:guia_do_aluno/app/modules/professors/pages/professors_page.dart';
import 'package:guia_do_aluno/app/modules/professors/repositories/professor_repository.dart';

class ProfessorsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfessorRepository()),
    Bind.lazySingleton((i) => ProfessorsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const ProfessorsPage(),
      guards: [AuthGuard()],
    ),
    ChildRoute(
      '/cadastro',
      child: (_, args) => const ProfessorRegistrationPage(),
      guards: [RoleGuard()],
    ),
    ChildRoute(
      '/atualizacao',
      child: (_, args) => ProfessorRegistrationPage(
        professor: args.data,
      ),
      guards: [RoleGuard()],
    ),
  ];
}
