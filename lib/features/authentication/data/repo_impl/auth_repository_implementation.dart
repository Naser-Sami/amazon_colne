import '/features/authentication/_authentication.dart';

class AuthRepositoryImplementation extends AuthenticationRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImplementation(this._remoteDataSource);

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final userModel = await _remoteDataSource.login(email: email, password: password);

    // map user model to entity
    return UserMapper.toEntity(userModel);
  }

  @override
  Future<UserEntity> signUp(
      {required String name, required String email, required String password}) async {
    final userModel = await _remoteDataSource.register(
      username: name,
      email: email,
      password: password,
    );

    // map user model to entity
    return UserMapper.toEntity(userModel);
  }
}
