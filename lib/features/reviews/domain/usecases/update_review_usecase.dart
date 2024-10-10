import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/repo/reviews_repo.dart';

class UpdateReviewUseCase
    extends BaseUseCase<UpdateReviewUseCaseInput, ReviewEntity> {
  final ReviewsRepository _reviewsRepository;

  UpdateReviewUseCase(this._reviewsRepository);

  @override
  ResultFuture<ReviewEntity> execute(UpdateReviewUseCaseInput input) {
    return _reviewsRepository.updateReview(input);
  }
}

class UpdateReviewUseCaseInput extends ReviewRequest {
  UpdateReviewUseCaseInput({
    required super.productId,
    required super.rating,
    required super.reviewDescription,
  });
}
