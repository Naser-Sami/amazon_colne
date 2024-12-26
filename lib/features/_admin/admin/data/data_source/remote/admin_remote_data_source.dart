import '/core/_core.dart';
import '../../models/_models.dart';

class AdminRemoteDataSource {
  Future<ProductModel> addProduct({required ProductModel product}) async {
    await ApiClient.post<ProductModel>(
      path: '/admin/add-product',
      parser: (data) => ProductModel.fromMap(data),
      data: product.toMap(),
    );

    return product;
  }

  Future<List<ProductModel>> getProducts() async {
    final products = await ApiClient.get<List<ProductModel>>(
      path: '/admin/get-products',
      parser: (data) => List<ProductModel>.from(
        data.map((e) => ProductModel.fromMap(e)),
      ),
    );
    return products ?? [];
  }

  Future<void> deleteProduct({required String id}) async {
    await ApiClient.delete(
      path: '/admin/delete-product/$id',
    );
  }
}
