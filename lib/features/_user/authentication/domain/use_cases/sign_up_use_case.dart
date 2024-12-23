import '../domain.dart';

class SignUpUseCase {
  final AuthenticationRepository repo;
  SignUpUseCase({required this.repo});

  Future<UserEntity> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return repo.signUp(name: name, email: email, password: password);
  }
}
