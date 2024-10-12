import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/utils/jwt_util.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/usecases/get_reviews_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._getReviewsUseCase) : super(ReviewsInitial());

  final GetReviewsUseCase _getReviewsUseCase;

  late final int _productId;
  late List<ReviewEntity> _reviews;

  List<ReviewEntity> get reviews => _reviews;

  void initReviews(int productId) async {
    _productId = productId;
    getReviews();
  }

  int get productId => _productId;

  void getReviews() async {
    emit(ReviewsLoading());
    final result = await _getReviewsUseCase.execute(_productId);
    result.fold(
      (failure) => emit(ReviewsError(failure.message)),
      (reviews) {
        _reviews = sortedReviews(reviews);
        emit(ReviewsSuccess());
      },
    );
  }

  List<ReviewEntity> sortedReviews(List<ReviewEntity> reviews) {
    final userId = JWTUtil.currentUserId;
    final userReview =
        reviews.firstWhereOrNull((review) => review.userId == userId);

    if (userReview == null) return reviews;

    final otherReviews =
        reviews.where((review) => review.userId != userId).toList();

    return [userReview, ...otherReviews];
  }

  bool get isUserReviewed {
    final userId = JWTUtil.currentUserId;
    return _reviews.any((review) => review.userId == userId);
  }

  @override
  Future<void> close() {
    getIt.unregister<ReviewsCubit>();
    return super.close();
  }
}
