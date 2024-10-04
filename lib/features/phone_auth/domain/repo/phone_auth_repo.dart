import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';

abstract class PhoneAuthRepository {
  ResultFuture<OTPEntity> sendOTP(String phoneNumber);

  ResultFuture<String> verifyOTP(VerifyOTPRequest request);
}
