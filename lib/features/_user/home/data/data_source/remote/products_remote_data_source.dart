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

  // Get deal of day
  Future<ProductModel> getDealOfDay() async {
    final dealOfDay = await ApiClient.get<ProductModel>(
      path: '/api/deal-of-day',
      parser: (data) => ProductModel.fromMap(data),
    );
    return dealOfDay ?? ProductModel.empty();
  }
}
