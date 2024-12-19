import '/core/_core.dart';
import '/features/authentication/_authentication.dart';

class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password}) async {
    final user = await ApiClient.post<UserModel>(
      path: '/api/login',
      parser: (data) => UserModel.fromJson(data),
      data: {"email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }

  Future<UserModel> register(
      {required String username, required String email, required String password}) async {
    final user = await ApiClient.post<UserModel>(
      path: '/api/sign-up',
      parser: (data) {
        return UserModel.fromJson(data);
      },
      data: {"username": username, "email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }
}
