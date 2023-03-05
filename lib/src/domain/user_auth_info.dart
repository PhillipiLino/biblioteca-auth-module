import 'package:equatable/equatable.dart';

class UserAuthInfo extends Equatable {
  final String accessToken;
  final String idToken;

  const UserAuthInfo(
    this.accessToken,
    this.idToken,
  );

  @override
  List<Object?> get props => [
        accessToken,
        idToken,
      ];
}
