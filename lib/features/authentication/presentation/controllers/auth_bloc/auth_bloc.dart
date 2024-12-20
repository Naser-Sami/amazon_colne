import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/features/_features.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final LoginUseCase _loginUseCase;

  AuthBloc(this._signUpUseCase, this._loginUseCase) : super(AuthInitialState()) {
    on<SingUpEvent>(_onSingUpEvent);
    on<LoginEvent>(_onLoginEvent);
  }

  void _onSingUpEvent(SingUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final user = await _signUpUseCase.call(
        name: event.username,
        email: event.email,
        password: event.password,
      );

      await ApiClient.setToken(user.token);
      emit(AuthSuccessState(user));
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final user = await _loginUseCase.call(
        email: event.email,
        password: event.password,
      );

      await ApiClient.setToken(user.token);
      emit(AuthSuccessState(user));
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
