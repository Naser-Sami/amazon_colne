import '../domain.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserEntity> login({
    required String email,
    required String password,
  });
}
