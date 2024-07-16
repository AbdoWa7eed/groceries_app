import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/phone_auth/data/models/verify_otp_request.dart';
import 'package:groceries_app/features/phone_auth/domain/entity/otp_entity.dart';

abstract class PhoneAuthRepository {
  ResultFuture<OTPEntity> sendOTP(String phoneNumber);

  ResultFuture<String> verifyOTP(VerifyOTPRequest request);
  
}
