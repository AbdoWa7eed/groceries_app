import 'package:groceries_app/core/data/models/otp/otp_response.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/features/phone_auth/data/api/phone_auth_api_service.dart';

abstract class PhoneAuthDataSource {
  Future<OTPResponse> sendOTP(String phoneNumber);

  Future<String> verifyOTP(VerifyOTPRequest request);
}

class PhoneAuthDataSourceImpl extends PhoneAuthDataSource {
  final PhoneAuthApiService _apiService;

  PhoneAuthDataSourceImpl(this._apiService);
  @override
  Future<OTPResponse> sendOTP(String phoneNumber) {
    return _apiService.sendOTP(phoneNumber);
  }

  @override
  Future<String> verifyOTP(VerifyOTPRequest request) {
    return _apiService.verifyOTP(request);
  }
}
