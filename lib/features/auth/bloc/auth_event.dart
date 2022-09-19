part of 'auth_bloc.dart';

abstract class AuthEvent {}

abstract class _AuthWithCredentials extends AuthEvent {
  final AuthData authData;

  _AuthWithCredentials({
    required this.authData,
  });
}

class AuthRegisterPressed extends _AuthWithCredentials {
  AuthRegisterPressed({required super.authData});
}

class AuthLoginPressed extends _AuthWithCredentials {
  AuthLoginPressed({required super.authData});
}

class AuthSignOutPressed extends AuthEvent {}

class AuthFailureFound extends AuthEvent {
  final Failure failure;

  AuthFailureFound(this.failure);
}
