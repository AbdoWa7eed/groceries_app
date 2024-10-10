import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/repo/reviews_repo.dart';

class GetReviewsUseCase extends BaseUseCase<int, List<ReviewEntity>> {
  final ReviewsRepository _reviewsRepository;

  GetReviewsUseCase(this._reviewsRepository);

  @override
  ResultFuture<List<ReviewEntity>> execute(int input) {
    return _reviewsRepository.getReviews(input);
  }
}
