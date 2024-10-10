import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';

abstract class ReviewsRepository {
  ResultFuture<List<ReviewEntity>> getReviews(int productId);
  ResultFuture<ReviewEntity> addReview(ReviewRequest review);
  ResultFuture<ReviewEntity> updateReview(ReviewRequest review);
  ResultFuture<ReviewEntity> deleteReview(int productId);
}
