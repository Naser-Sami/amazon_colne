import '../../_authentication.dart';

class UserMapper {
  UserMapper._();

  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      name: userModel.name,
      email: userModel.email,
      password: userModel.password,
      address: userModel.address,
      type: userModel.type,
      id: userModel.id,
      token: userModel.token,
      version: userModel.version,
    );
  }

  static UserModel toModel(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      password: userEntity.password,
      address: userEntity.address,
      type: userEntity.type,
      id: userEntity.id,
      token: userEntity.token,
      version: userEntity.version,
    );
  }
}
