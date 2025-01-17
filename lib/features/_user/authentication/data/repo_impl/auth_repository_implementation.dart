import '../../_authentication.dart';

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
    final userModel = await _remoteDataSource.singUp(name: name, email: email, password: password);

    // map user model to entity
    return UserMapper.toEntity(userModel);
  }

  @override
  Future<bool> tokenIsValid() async {
    return await _remoteDataSource.tokenIsValid();
  }

  @override
  Future<UserEntity> getUserData() async {
    final user = await _remoteDataSource.getUserData();
    return UserMapper.toEntity(user);
  }
}
