part of 'change_password_cubit.dart';

sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final String message;
  ChangePasswordSuccess(this.message);
}

final class ChangePasswordError extends ChangePasswordState {
  final String error;
  ChangePasswordError(this.error);
}

final class ChangePasswordLoading extends ChangePasswordState {}
