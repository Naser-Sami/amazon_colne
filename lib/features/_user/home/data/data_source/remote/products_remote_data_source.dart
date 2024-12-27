import '/core/_core.dart';
import '/features/_features.dart';

class ProductsRemoteDataSource {
  // Get all products
  Future<List<ProductModel>> getProducts(String category) async {
    final products = await ApiClient.get<List<ProductModel>>(
      path: '/api/products',
      queryParameters: {'category': category},
      parser: (data) => List<ProductModel>.from(
        data.map((e) => ProductModel.fromMap(e)),
      ).toList(),
    );

    return products ?? [];
  }
}
