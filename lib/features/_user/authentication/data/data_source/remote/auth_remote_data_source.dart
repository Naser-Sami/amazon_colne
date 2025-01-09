import '/core/_core.dart';
import '../../../_authentication.dart';

class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password}) async {
    final user = await ApiClient.post<UserModel>(
      path: '/api/login',
      parser: (data) => UserModel.fromJson(data),
      data: {"email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }

  Future<UserModel> singUp(
      {required String name, required String email, required String password}) async {
    // create user model
    UserModel userModel = UserModel(
        name: name,
        email: email,
        password: password,
        address: "",
        type: "",
        id: "",
        token: "",
        version: 0,
        cart: []);

    // send request to server
    final user = await ApiClient.post<UserModel>(
      path: '/api/sign-up',
      parser: (data) => UserModel.fromJson(data),
      data: userModel.toJson(),
    );

    return user ?? UserModel.empty();
  }

  Future<bool> tokenIsValid() async {
    // send request to server
    final isTokenValid = await ApiClient.post<bool>(
      path: '/tokenIsValid',
      parser: (data) => data,
    );
    return isTokenValid ?? false;
  }

  Future<UserModel> getUserData() async {
    // send request to server
    final user = await ApiClient.get<UserModel>(
      path: '/',
      parser: (data) => UserModel.fromJson(data),
    );
    return user ?? UserModel.empty();
  }
}
