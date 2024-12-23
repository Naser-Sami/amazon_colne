import '../domain.dart';

class TokenIsValidUseCase {
  final AuthenticationRepository repo;
  TokenIsValidUseCase({required this.repo});

  Future<bool> call() async {
    return await repo.tokenIsValid();
  }
}
