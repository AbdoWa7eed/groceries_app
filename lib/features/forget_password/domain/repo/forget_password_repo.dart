import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/forget_password/data/models/reset_password_request.dart';

abstract class ForgetPasswordRepository {
  ResultFuture<OTPEntity> sendVerificationCode(String email);
  ResultFuture<OTPEntity> verifyEmail(VerifyOTPRequest verifyOTPRequest);
  ResultFuture<AuthEntity> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
