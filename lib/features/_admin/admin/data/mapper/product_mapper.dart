import '../../_admin.dart';

class ProductMapper {
  static ProductEntities toEntity(ProductModel model) {
    return ProductEntities(
      name: model.name,
      description: model.description,
      quantity: model.quantity,
      images: model.images,
      category: model.category,
      price: model.price,
      id: model.id,
    );
  }

  static ProductModel toModel(ProductEntities entity) {
    return ProductModel(
      name: entity.name,
      description: entity.description,
      quantity: entity.quantity,
      images: entity.images,
      category: entity.category,
      price: entity.price,
      id: entity.id,
    );
  }
}
