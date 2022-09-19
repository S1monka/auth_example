import 'package:auth_example/core/utils/failures.dart';
import 'package:auth_example/data/models/auth_data.dart';
import 'package:auth_example/data/models/user.dart';
import 'package:auth_example/data/repositories/auth_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthRegisterPressed>((event, emit) async {
      final user = await _authRepository.signUp(authData: event.authData);

      emit(AuthState.authenticated(user));
    });

    on<AuthLoginPressed>((event, emit) async {
      final user = await _authRepository.signIn(authData: event.authData);

      emit(AuthState.authenticated(user));
    });

    on<AuthSignOutPressed>(
      (event, emit) {
        emit(const AuthState.unAuthenticated());
      },
    );

    on<AuthFailureFound>((event, emit) {
      emit(state.copyWith(failure: event.failure));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (error is Failure) {
      add(AuthFailureFound(error));
    }
  }
}
