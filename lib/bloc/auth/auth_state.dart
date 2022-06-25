part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitState extends AuthState {
  const AuthInitState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthFailState extends AuthState {
  const AuthFailState({required this.reason});

  final String reason;

  @override
  List<Object?> get props => [reason];
}
