part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess<T> extends ForgetPasswordState {
  final T? data;
  ForgetPasswordSuccess([this.data]);
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String error;

  ForgetPasswordError(this.error);
}
