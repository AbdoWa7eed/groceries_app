import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/repo/reviews_repo.dart';

class AddReviewUseCase
    extends BaseUseCase<AddReviewUseCaseInput, ReviewEntity> {
  final ReviewsRepository _reviewsRepository;

  AddReviewUseCase(this._reviewsRepository);

  @override
  ResultFuture<ReviewEntity> execute(AddReviewUseCaseInput input) {
    return _reviewsRepository.addReview(input);
  }
}

class AddReviewUseCaseInput extends ReviewRequest {
  AddReviewUseCaseInput({
    required super.productId,
    required super.rating,
    required super.reviewDescription,
  });
}
