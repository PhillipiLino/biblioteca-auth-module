import 'domain/user_auth_info.dart';

abstract class ILoginCallback {
  onLoginSuccess(UserAuthInfo info);
  onLoginFailure(Object? error, StackTrace stack);
}
