part of 'checkout_cubit.dart';

final class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class PlaceOrderLoading extends CheckoutState {}

final class PlaceOrderSuccess extends CheckoutState {}

final class PlaceOrderError extends CheckoutState {
  final String message;
  PlaceOrderError(this.message);
}

final class ConfirmPaymentLoading extends CheckoutState {}

final class ConfirmPaymentSuccess extends CheckoutState {}

final class ConfirmPaymentError extends CheckoutState {
  final String message;
  ConfirmPaymentError(this.message);
}

final class ChangePaymentMethodState extends CheckoutState {}
