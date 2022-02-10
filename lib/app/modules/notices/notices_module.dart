import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/app_module.dart';
import 'package:guia_do_aluno/app/modules/notices/controllers/notice_controller.dart';
import 'package:guia_do_aluno/app/modules/notices/pages/notice_registration_page.dart';
import 'package:guia_do_aluno/app/modules/notices/pages/notices_page.dart';
import 'package:guia_do_aluno/app/modules/notices/repositories/notice_repository.dart';

class NoticesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NoticeRepository()),
    Bind.lazySingleton((i) => NoticeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const NoticesPage(
        
      ),
      guards: [AuthGuard()],
    ),
    ChildRoute(
      '/cadastro',
      child: (_, args) => const NoticeRegistrationPage(
       
      ),
      guards: [RoleGuard()],
    ),
    ChildRoute(
      '/atualizacao',
      child: (_, args) => NoticeRegistrationPage(
        notice: args.data,
       
      ),
      guards: [RoleGuard()],
    ),
  ];
}
