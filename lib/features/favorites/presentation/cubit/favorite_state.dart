part of 'favorite_cubit.dart';

abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {}

final class FavoriteError extends FavoriteState {
  String message;
  FavoriteError(this.message);
}

final class RemoveFromFavoriteError extends FavoriteState {
  String message;
  RemoveFromFavoriteError(this.message);
}

final class RemoveFromFavoriteLoading extends FavoriteState {}

final class RemoveFromFavoriteSuccess extends FavoriteState {
  String message;
  RemoveFromFavoriteSuccess(this.message);
}

final class AddAllToCartError extends FavoriteState {
  String message;
  AddAllToCartError(this.message);
}

final class AddAllToCartSuccess extends FavoriteState {
  String message;
  AddAllToCartSuccess(this.message);
}
