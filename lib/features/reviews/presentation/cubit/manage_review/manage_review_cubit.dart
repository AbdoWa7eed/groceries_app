import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/domain/usecases/delete_review_usecase.dart';
import 'package:groceries_app/features/reviews/domain/usecases/update_review_usecase.dart';

part 'manage_review_state.dart';

class ManageReviewCubit extends Cubit<ManageReviewState> {
  ManageReviewCubit(
    this._updateReviewUseCase,
    this._deleteReviewUseCase,
  ) : super(ManageReviewInitial());

  final UpdateReviewUseCase _updateReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  late final ReviewEntity _review;

  void setReview(ReviewEntity review) {
    _review = review;
    rating = _review.rating;
  }

  ReviewEntity get review => _review;

  late double rating;

  void updateReview({
    required String reviewDescription,
  }) async {
    emit(ManageReviewLoading());
    final input = _getUpdateReviewUseCaseInput(rating, reviewDescription);
    if (input == null) return;
    final result = await _updateReviewUseCase.execute(input);

    result.fold(
      (failure) => emit(ManageReviewError(failure.message)),
      (review) => emit(ManageReviewSuccess(review)),
    );
  }

  UpdateReviewUseCaseInput? _getUpdateReviewUseCaseInput(
    double rating,
    String reviewDescription,
  ) {
    if (rating == _review.rating &&
        reviewDescription == _review.reviewDescription) {
      emit(ManageReviewError(AppStrings.nothingToUpdate));
      return null;
    }

    return UpdateReviewUseCaseInput(
      productId: _review.productId,
      rating: rating,
      reviewDescription: reviewDescription,
    );
  }

  void deleteReview() async {
    emit(ManageReviewLoading());
    final result = await _deleteReviewUseCase.execute(_review.productId);

    result.fold(
      (failure) => emit(ManageReviewError(failure.message)),
      (review) => emit(ManageReviewSuccess(review)),
    );
  }

  @override
  Future<void> close() {
    getIt.unregister<ManageReviewCubit>();
    return super.close();
  }
}
