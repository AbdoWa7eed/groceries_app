part of 'manage_review_cubit.dart';

sealed class ManageReviewState {}

final class ManageReviewInitial extends ManageReviewState {}

final class ManageReviewLoading extends ManageReviewState {}

final class ManageReviewSuccess extends ManageReviewState {
  final ReviewEntity review;
  ManageReviewSuccess(this.review);
}

final class ManageReviewError extends ManageReviewState {
  final String message;
  ManageReviewError(this.message);
}
