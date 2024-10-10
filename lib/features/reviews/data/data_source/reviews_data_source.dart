import 'package:groceries_app/features/reviews/data/api/reviews_api_service.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/data/models/reviews_response.dart';
import 'package:groceries_app/features/reviews/data/models/single_view_response.dart';

abstract class ReviewsDataSource {
  Future<ReviewsResponse> getReviews(int productId);
  Future<SingleReviewResponse> addReview(ReviewRequest review);
  Future<SingleReviewResponse> updateReview(ReviewRequest review);
  Future<SingleReviewResponse> deleteReview(int productId);
}

class ReviewsDataSourceImpl implements ReviewsDataSource {
  final ReviewsApiService _apiService;
  ReviewsDataSourceImpl(this._apiService);

  @override
  Future<SingleReviewResponse> addReview(ReviewRequest review) {
    return _apiService.addReview(review);
  }

  @override
  Future<SingleReviewResponse> deleteReview(int productId) {
    return _apiService.deleteReview(productId.toString());
  }

  @override
  Future<ReviewsResponse> getReviews(int productId) {
    return _apiService.getReviews(productId.toString());
  }

  @override
  Future<SingleReviewResponse> updateReview(ReviewRequest review) {
    return _apiService.editReview(review.productId.toString(), review);
  }
}
