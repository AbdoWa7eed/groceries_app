import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/reviews/data/data_source/reviews_data_source.dart';
import 'package:groceries_app/features/reviews/data/mapper/mapper.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/repo/reviews_repo.dart';

class ReviewsRepositoryImpl implements ReviewsRepository {
  final ReviewsDataSource _reviewsDataSource;

  ReviewsRepositoryImpl(this._reviewsDataSource);

  @override
  ResultFuture<List<ReviewEntity>> getReviews(int productId) async {
    try {
      final result = await _reviewsDataSource.getReviews(productId);
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      final reviewEntities =
          result.data!.reviews?.map((review) => review.toEntity()).toList() ??
              [];
      return Right(reviewEntities);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<ReviewEntity> addReview(ReviewRequest review) async {
    try {
      final result = await _reviewsDataSource.addReview(review);
      if (result.review == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.review!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<ReviewEntity> updateReview(ReviewRequest review) async {
    try {
      final result = await _reviewsDataSource.updateReview(review);
      if (result.review == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.review!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<ReviewEntity> deleteReview(int productId) async {
    try {
      final result = await _reviewsDataSource.deleteReview(productId);
      if (result.review == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.review!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
