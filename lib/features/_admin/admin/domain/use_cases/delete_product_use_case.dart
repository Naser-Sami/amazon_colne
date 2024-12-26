import '../domain.dart';

class DeleteProductUseCase {
  final IAdminRepository repo;
  DeleteProductUseCase(this.repo);

  Future<void> call({required String id}) async {
    await repo.deleteProduct(id: id);
  }
}
