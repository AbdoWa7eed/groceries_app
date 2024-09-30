part of 'account_cubit.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountSuccess extends AccountState {}

final class AccountError extends AccountState {
  final String error;
  AccountError({required this.error});
}

final class AccountLogoutLoading extends AccountState {}

final class AccountLogoutSuccess extends AccountState {}

final class AccountLogoutError extends AccountState {
  final String error;
  AccountLogoutError({required this.error});
}
