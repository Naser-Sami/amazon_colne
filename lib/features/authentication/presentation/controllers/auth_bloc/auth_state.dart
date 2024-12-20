part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity user;
  AuthSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {
  final String error;
  AuthFailureState(this.error);

  @override
  List<Object> get props => [error];
}
