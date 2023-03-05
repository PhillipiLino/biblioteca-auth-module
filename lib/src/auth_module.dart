import 'package:biblioteca_auth_module/src/presenter/pages/login_page.dart';
import 'package:biblioteca_auth_module/src/presenter/stores/login_page_store.dart';
import 'package:clean_architecture_utils/modular.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((inject) => LoginPageStore(inject.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const LoginPage(),
        )
      ];
}
