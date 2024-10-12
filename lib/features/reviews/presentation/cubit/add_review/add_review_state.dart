part of 'add_review_cubit.dart';

sealed class AddReviewState {}

final class AddReviewInitial extends AddReviewState {}

final class AddReviewLoading extends AddReviewState {}

final class AddReviewSuccess extends AddReviewState {}

final class AddReviewError extends AddReviewState {
  final String message;
  AddReviewError(this.message);
}
