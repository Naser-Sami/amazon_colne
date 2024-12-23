import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/features/_features.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final LoginUseCase _loginUseCase;
  final TokenIsValidUseCase _tokenIsValidUseCase;
  final GetUserDataUseCase _getUserUseCase;
  UserEntity? _user;

  AuthBloc(
    this._signUpUseCase,
    this._loginUseCase,
    this._tokenIsValidUseCase,
    this._getUserUseCase,
  ) : super(AuthInitialState()) {
    on<SingUpEvent>(_onSingUpEvent);
    on<LoginEvent>(_onLoginEvent);
    on<GetUserDataEvent>(_onGetUserDataEvent);
  }

  // Getter User
  UserEntity? get user => _user;

  // Setter User
  void setUser(UserEntity user) => _user = user;

  void _onSingUpEvent(SingUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final user = await _signUpUseCase.call(
        name: event.username,
        email: event.email,
        password: event.password,
      );

      await ApiClient.setToken(user.token);
      setUser(user);
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
      setUser(user);
      emit(AuthSuccessState(user));
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  void _onGetUserDataEvent(GetUserDataEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      // Check if the user is authenticated
      String? token = await ApiClient.getToken();

      if (token == null) {
        await ApiClient.setToken('');
      }

      // Check if the token is valid
      final isValid = await _tokenIsValidUseCase.call();

      if (isValid) {
        // Get user data
        final user = await _getUserUseCase.call();

        await ApiClient.setToken(user.token);
        setUser(user);

        emit(AuthSuccessState(user));
      } else {
        await ApiClient.setToken('');
      }
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
