part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}

final class AddToCartSuccess extends CartState {
  final String message;
  AddToCartSuccess(this.message);
}

final class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

final class RemoveFromCartSuccess extends CartState {
  final String message;
  RemoveFromCartSuccess(this.message);
}

final class RemoveFromCartError extends CartState {
  final String message;
  RemoveFromCartError(this.message);
}

final class UpdateCartItemSuccess extends CartState {
  final String message;
  UpdateCartItemSuccess(this.message);
}

final class UpdateCartItemError extends CartState {
  final String message;
  UpdateCartItemError(this.message);
}
