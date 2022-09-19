part of 'auth_bloc.dart';

enum AuthStatus { authorized, unauthorized }

class AuthState extends Equatable {
  final User? user;
  final AuthStatus authStatus;
  final Failure? failure;

  const AuthState(
    this.user,
    this.authStatus,
    this.failure,
  );

  bool get isAuthed => authStatus == AuthStatus.authorized;

  const AuthState.initial()
      : user = null,
        failure = null,
        authStatus = AuthStatus.unauthorized;

  const AuthState.authenticated(this.user)
      : authStatus = AuthStatus.authorized,
        failure = null;

  const AuthState.unAuthenticated() : this.initial();

  AuthState copyWith({
    User? user,
    AuthStatus? authStatus,
    Failure? failure,
  }) {
    return AuthState(
      user ?? this.user,
      authStatus ?? this.authStatus,
      failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [user, authStatus, failure];
}
