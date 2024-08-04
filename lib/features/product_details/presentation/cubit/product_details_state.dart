part of 'product_details_cubit.dart';

abstract class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

class GetProductDetailsLoading extends ProductDetailsState {}

class GetProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntity productDetailsEntity;
  GetProductDetailsSuccess(this.productDetailsEntity);
}

class GetProductDetailsError extends ProductDetailsState {
  final String message;
  GetProductDetailsError(this.message);
}

class UpdateFavoriteSuccess extends ProductDetailsState {
  final String message;
  UpdateFavoriteSuccess(this.message);
}

class UpdateFavoriteError extends ProductDetailsState {
  final String message;
  UpdateFavoriteError(this.message);
}
