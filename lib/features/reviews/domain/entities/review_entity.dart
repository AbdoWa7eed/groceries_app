import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int productId;
  final double rating;
  final DateTime reviewDate;
  final String reviewDescription;
  final String username;
  final int userId;
  final String imageUrl;

  const ReviewEntity({
    required this.productId,
    required this.rating,
    required this.reviewDate,
    required this.reviewDescription,
    required this.username,
    required this.userId,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        productId,
        rating,
        reviewDate,
        reviewDescription,
        username,
        userId,
        imageUrl
      ];
}
