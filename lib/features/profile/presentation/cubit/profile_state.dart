part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {}

final class UpdateProfileError extends ProfileState {
  final String error;
  UpdateProfileError(this.error);
}

final class UpdateProfileLoading extends ProfileState {}

final class SetProfileImage extends ProfileState {}
