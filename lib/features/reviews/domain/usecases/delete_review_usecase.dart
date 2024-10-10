import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/repo/reviews_repo.dart';

class DeleteReviewUseCase extends BaseUseCase<int, ReviewEntity> {
  final ReviewsRepository _reviewsRepository;

  DeleteReviewUseCase(this._reviewsRepository);

  @override
  ResultFuture<ReviewEntity> execute(int input) {
    return _reviewsRepository.deleteReview(input);
  }
}
