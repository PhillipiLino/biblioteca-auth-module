import 'package:clean_architecture_utils/failures.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/user_auth_info.dart';
import '../../login_callback_interface.dart';

class LoginPageStore {
  final ILoginCallback? callback;

  LoginPageStore(this.callback);

  doLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    googleUser?.authentication
        .then(_parseSuccess)
        .onError((error, stackTrace) => callback?.onLoginFailure(
              error,
              stackTrace,
            ));
  }

  _parseSuccess(GoogleSignInAuthentication googleAuth) {
    final accessToken = googleAuth.accessToken ?? '';
    final idToken = googleAuth.idToken ?? '';

    if (accessToken.isEmpty || idToken.isEmpty) {
      callback?.onLoginFailure(const GoogleSignInFailure(), StackTrace.current);
      return;
    }

    final info = UserAuthInfo(accessToken, idToken);
    callback?.onLoginSuccess(info);
  }
}

class GoogleSignInFailure extends Failure {
  const GoogleSignInFailure() : super('');
}
