import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/app_module.dart';
import 'package:guia_do_aluno/app/modules/professors/repositories/professor_repository.dart';
import 'package:guia_do_aluno/app/modules/subjects/controllers/subject_controller.dart';
import 'package:guia_do_aluno/app/modules/subjects/pages/subject_registration_page.dart';
import 'package:guia_do_aluno/app/modules/subjects/pages/subjects_page.dart';
import 'repositories/class_day_repository.dart';
import 'repositories/class_time_repository.dart';
import 'repositories/modality_repository.dart';
import 'repositories/period_repository.dart';
import 'repositories/subject_repository.dart';

class SubjectsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SubjectRepository()),
    Bind.lazySingleton((i) => SubjectController()),
    Bind.lazySingleton((i) => ClassDayRepository()),
    Bind.lazySingleton((i) => ClassTimeRepository()),
    Bind.lazySingleton((i) => ModalityRepository()),
    Bind.lazySingleton((i) => PeriodRepository()),
    Bind.lazySingleton((i) => ProfessorRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const SubjectsPage(
      ),
      guards: [AuthGuard()],
    ),
    ChildRoute(
      '/cadastro',
      child: (_, args) => const SubjectRegistrationPage(),
      guards: [RoleGuard()],
    ),
    ChildRoute(
      '/atualizacao',
      child: (_, args) => SubjectRegistrationPage(
        subject: args.data,
      ),
      guards: [RoleGuard()],
    ),
  ];
}
