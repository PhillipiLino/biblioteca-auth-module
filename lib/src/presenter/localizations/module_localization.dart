// coverage:ignore-file

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages/messages_all.dart';

class ModuleLocalizations {
  static Future<ModuleLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return ModuleLocalizations();
    });
  }

  static ModuleLocalizations? of(BuildContext context) {
    return Localizations.of<ModuleLocalizations>(context, ModuleLocalizations);
  }

  final login = _LoginPage();
}

class _LoginPage {
  String get loginPageTitle => Intl.message('', name: 'loginPageTitle');
  String get loginPageDescription =>
      Intl.message('', name: 'loginPageDescription');
  String get loginPageGoogleButton =>
      Intl.message('', name: 'loginPageGoogleButton');
}
