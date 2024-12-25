import '/core/_core.dart';
import '../../models/_models.dart';

class AdminRemoteDataSource {
  Future<void> sellProduct({required ProductModel product}) async {
    await ApiClient.post<ProductModel>(
      path: '/admin/add-product',
      parser: (data) => ProductModel.fromMap(data),
      data: product.toMap(),
    );
  }
}
