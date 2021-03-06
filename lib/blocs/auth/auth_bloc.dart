import 'dart:async';

import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepo) : super(const AuthInitState()) {
    on<AuthLogInEvent>(_logIn);
  }

  final AuthRepo _authRepo;

  Future<void> _logIn(AuthLogInEvent event, Emitter<AuthState> emit) async {
    if (state is! AuthLoadingState) {
      emit(const AuthLoadingState());
    }

    final user = await _authRepo.logIn(event.email, event.password);

    if (user != null) {
      emit(
        AuthSuccessState(user: user),
      );
    } else {
      emit(const AuthFailState());
    }
  }
}
