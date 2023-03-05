import 'package:biblioteca_auth_module/src/presenter/images.dart';
import 'package:biblioteca_auth_module/src/presenter/localizations/module_localization.dart';
import 'package:biblioteca_auth_module/src/presenter/stores/login_page_store.dart';
import 'package:biblioteca_components/biblioteca_components.dart';
import 'package:clean_architecture_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends MainPageState<LoginPage, LoginPageStore> {
  final localization = ModuleLocalizations().login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localization.loginPageTitle,
              textAlign: TextAlign.center,
              style: MainTextStyles.bodyLargeBold.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              localization.loginPageDescription,
              textAlign: TextAlign.center,
              style: MainTextStyles.bodyMediumRegular.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 64),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 48),
              color: Colors.amber.withOpacity(0.7),
              child: const Image(image: ModuleImages.login),
            ),
            const SizedBox(height: 32),
            SignInButton(
              Buttons.Google,
              text: localization.loginPageGoogleButton,
              onPressed: () async {
                trackersHelper.trackCustomEvent(
                  'btn_google_sign_in_clicked',
                  infos: {},
                );

                store.doLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
