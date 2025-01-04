import '../../_admin.dart';

class RatingMapper {
  static RatingEntities toEntity(RatingModel model) {
    return RatingEntities(userId: model.userId, rating: model.rating);
  }

  static RatingModel toModel(RatingEntities entity) {
    return RatingModel(userId: entity.userId, rating: entity.rating);
  }
}
