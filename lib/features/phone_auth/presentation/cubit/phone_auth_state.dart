part of 'phone_auth_cubit.dart';

abstract class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class SendOTPLoadingState extends PhoneAuthState {}

final class SendOTPSuccessState extends PhoneAuthState {}

final class SendOTPErrorState extends PhoneAuthState {
  String errorMessage;
  SendOTPErrorState(this.errorMessage);
}


final class VerifyOTPLoadingState extends PhoneAuthState {}

final class VerifyOTPSuccessState extends PhoneAuthState {}

final class VerifyOTPErrorState extends PhoneAuthState {
  String errorMessage;
  VerifyOTPErrorState(this.errorMessage);
}
