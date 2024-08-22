part of 'shop_cubit.dart';

abstract class ShopState {}

final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopSuccess extends ShopState {}

final class ShopError extends ShopState {
  final String error;
  ShopError(this.error);
}

final class GetMoreGroceriesLoading extends ShopState {}

final class GetMoreGroceriesSuccess extends ShopState {}

final class GetMoreGroceriesError extends ShopState {
  final String error;
  GetMoreGroceriesError(this.error);
}




