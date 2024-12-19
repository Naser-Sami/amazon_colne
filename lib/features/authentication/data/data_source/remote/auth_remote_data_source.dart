import '/core/_core.dart';
import '/features/authentication/_authentication.dart';

class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password}) async {
    final user = await ApiClient.post<UserModel>(
      path: '/api/login',
      parser: (data) => UserModel.fromJson(data['user']),
      data: {"email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // create user model
    late UserModel userModel = UserModel(
      name: name,
      email: email,
      password: password,
      address: "",
      type: "",
      id: "",
      version: 0,
    );

    // send request to server
    final user = await ApiClient.post<UserModel>(
      path: '/api/sign-up',
      parser: (data) => UserModel.fromJson(data['user']),
      data: userModel.toJson(),
    );

    return user ?? UserModel.empty();
  }
}
