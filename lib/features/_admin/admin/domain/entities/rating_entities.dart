import 'package:equatable/equatable.dart';

class RatingEntities extends Equatable {
  final String userId;
  final double rating;

  const RatingEntities({
    required this.userId,
    required this.rating,
  });

  RatingEntities copyWith({
    String? userId,
    double? rating,
  }) {
    return RatingEntities(
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
    );
  }

  factory RatingEntities.empty() => RatingEntities(userId: '', rating: 0.0);

  @override
  String toString() {
    return 'RatingEntities(userId: $userId, rating: $rating)';
  }

  @override
  List<Object?> get props => [userId, rating];
}
