import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/modules/auth/pages/landing_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LandingPage()),
  ];
}
