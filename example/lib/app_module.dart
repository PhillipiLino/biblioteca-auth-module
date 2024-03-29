// coverage:ignore-file
// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:biblioteca_auth_module/biblioteca_auth_module.dart';
import 'package:clean_architecture_utils/events.dart';
import 'package:example/app_widget_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'event_controller.dart';
import 'trackers.dart';

class LoginCallback extends ILoginCallback {
  @override
  onLoginFailure(Object? error, StackTrace stack) {}

  @override
  onLoginSuccess(UserAuthInfo info) {
    log(info.toString());
  }
}

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<LoginCallback>((i) => LoginCallback()),
    Bind<AppWidgetStore>((i) => AppWidgetStore()),
    Bind.singleton<EventBus>((i) => EventBus()),
    Bind<Trackers>((i) => Trackers()),
    Bind.singleton<EventController>((i) => EventController(
          i.get(),
          i.get(),
        )),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: AuthModule(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
