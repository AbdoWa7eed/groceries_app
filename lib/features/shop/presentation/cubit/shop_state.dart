part of 'shop_cubit.dart';

abstract class ShopState {}

final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopSuccess extends ShopState {}

final class ShopError extends ShopState {
  final String error;
  ShopError(this.error);
}

final class GetBestSellingLoading extends ShopState {}

final class GetBestSellingError extends ShopState {
  final String error;
  GetBestSellingError(this.error);
}

final class GetBestSellingSuccess extends ShopState {}

final class GetExclusiveOffersLoading extends ShopState {}

final class GetExclusiveOffersSuccess extends ShopState {}

final class GetExclusiveOffersError extends ShopState {
  final String error;
  GetExclusiveOffersError(this.error);
}

final class GetGroceriesLoading extends ShopState {}

final class GetGroceriesSuccess extends ShopState {}

final class GetGroceriesError extends ShopState {
  final String error;
  GetGroceriesError(this.error);
}

final class GetBannersLoading extends ShopState {}

final class GetBannersSuccess extends ShopState {}

final class GetBannersError extends ShopState {
  final String error;
  GetBannersError(this.error);
}

final class SeeAllScreenListChangesState extends ShopState {}




