import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/app_module.dart';
import 'package:guia_do_aluno/app/modules/courseware/controllers/courseware_controller.dart';
import 'package:guia_do_aluno/app/modules/courseware/pages/courseware_page.dart';
import 'package:guia_do_aluno/app/modules/courseware/pages/courseware_registration_page.dart';
import 'package:guia_do_aluno/app/modules/courseware/repositories/courseware_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/repositories/subject_repository.dart';

class CoursewareModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CoursewareRepository()),
    Bind.lazySingleton((i) => SubjectRepository()),
    Bind.lazySingleton((i) => CoursewareController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => CoursewarePage(
        subjectID: args.data,
      ),
      guards: [AuthGuard()],
    ),
    ChildRoute(
      '/cadastro',
      child: (_, args) => const CoursewareRegistrationPage(),
      guards: [RoleGuard()],
    ),
    ChildRoute(
      '/atualizacao',
      child: (_, args) => CoursewareRegistrationPage(
        courseware: args.data,  
      ),
      guards: [RoleGuard()],
    ),
  ];
}
