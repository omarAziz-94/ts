part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthNotFound extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginCompleted extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LogoutCompleted extends AuthState {
  @override
  List<Object?> get props => [];
}

class LogoutError extends AuthState {
  final String message;

  LogoutError(this.message);

  @override
  List<Object?> get props => [message];
}
