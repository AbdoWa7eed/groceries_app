part of 'reviews_cubit.dart';

sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {}

final class ReviewsError extends ReviewsState {
  final String message;
  ReviewsError(this.message);
}
