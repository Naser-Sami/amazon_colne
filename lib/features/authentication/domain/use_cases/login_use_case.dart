import '../domain.dart';

class LoginUseCase {
  final AuthenticationRepository repo;
  LoginUseCase({required this.repo});

  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return repo.login(email: email, password: password);
  }
}
