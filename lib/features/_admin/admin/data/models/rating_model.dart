import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final String userId;
  final double rating;

  const RatingModel({
    required this.userId,
    required this.rating,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'rating': rating,
      };

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      userId: map['userId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  RatingModel copyWith({
    String? userId,
    double? rating,
  }) =>
      RatingModel(
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
      );

  factory RatingModel.empty() => RatingModel(userId: '', rating: 0.0);

  @override
  String toString() {
    return 'RatingModel(userId: $userId, rating: $rating)';
  }

  @override
  List<Object?> get props => [userId, rating];
}
