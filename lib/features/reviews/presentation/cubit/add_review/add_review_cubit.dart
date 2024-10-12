import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/features/reviews/domain/usecases/add_review_usecase.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this._addReviewUseCase) : super(AddReviewInitial());

  final AddReviewUseCase _addReviewUseCase;

  late final int productId;

  void setProductId(int productId) {
    this.productId = productId;
  }

  double rating = 0.0;

  void addReview({
    required String reviewDescription,
  }) async {
    emit(AddReviewLoading());
    if (rating == 0.0) {
      emit(AddReviewError(AppStrings.noRating));
      return;
    }
    final result = await _addReviewUseCase.execute(AddReviewUseCaseInput(
      productId: productId,
      rating: rating,
      reviewDescription: reviewDescription,
    ));

    result.fold(
      (failure) => emit(AddReviewError(failure.message)),
      (review) => emit(AddReviewSuccess()),
    );
  }

  @override
  Future<void> close() {
    getIt.unregister<AddReviewCubit>();
    return super.close();
  }
}
