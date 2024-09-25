part of 'checkout_cubit.dart';

final class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class PlaceOrderLoading extends CheckoutState {}

final class PlaceOrderSuccess extends CheckoutState {
  PlaceOrderEntity placeOrderEntity;
  PlaceOrderSuccess(this.placeOrderEntity);
}

final class PlaceOrderError extends CheckoutState {
  final String message;
  PlaceOrderError(this.message);
}

final class ChangePaymentMethodState extends CheckoutState {}
