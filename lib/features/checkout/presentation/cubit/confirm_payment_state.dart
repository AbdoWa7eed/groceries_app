part of 'confirm_payment_cubit.dart';

abstract final class ConfirmPaymentState {}

final class ConfirmPaymentInitial extends ConfirmPaymentState {}

final class ConfirmPaymentLoading extends ConfirmPaymentState {}

final class ConfirmPaymentSuccess extends ConfirmPaymentState {}

final class ConfirmPaymentError extends ConfirmPaymentState {
  final String message;
  ConfirmPaymentError(this.message);
}

final class ChangeProgressState extends ConfirmPaymentState {}

final class ChangeUrlState extends ConfirmPaymentState {}
