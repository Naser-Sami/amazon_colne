import '../domain.dart';

class GetUserDataUseCase {
  final AuthenticationRepository repo;
  GetUserDataUseCase({required this.repo});

  Future<UserEntity> call() async {
    return await repo.getUserData();
  }
}
