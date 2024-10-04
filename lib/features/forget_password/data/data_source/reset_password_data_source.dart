import 'package:groceries_app/core/data/models/auth/auth_response.dart';
import 'package:groceries_app/core/data/models/otp/otp_response.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/features/forget_password/data/api/forget_password_api_service.dart';
import 'package:groceries_app/features/forget_password/data/models/reset_password_request.dart';

abstract class ForgetPasswordDataSource {
  Future<OTPResponse> sendVerificationCode(String email);
  Future<OTPResponse> verifyEmail(VerifyOTPRequest verifyOTPRequest);
  Future<AuthResponse> resetPassword(ResetPasswordRequest resetPasswordRequest);
}

class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  final ForgetPasswordApiService _apiService;

  ForgetPasswordDataSourceImpl(this._apiService);

  @override
  Future<OTPResponse> sendVerificationCode(String email) {
    return _apiService.sendEmailVerificationCode(email);
  }

  @override
  Future<OTPResponse> verifyEmail(VerifyOTPRequest verifyOTPRequest) {
    return _apiService.verifyEmail(verifyOTPRequest);
  }

  @override
  Future<AuthResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return _apiService.resetPassword(resetPasswordRequest);
  }
}
