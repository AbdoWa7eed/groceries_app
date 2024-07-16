import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/phone_auth/data/models/otp_response/otp_response.dart';
import 'package:groceries_app/features/phone_auth/data/models/verify_otp_request.dart';
import 'package:retrofit/retrofit.dart';

part 'phone_auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PhoneAuthApiService {
  factory PhoneAuthApiService(Dio dio, {String baseUrl}) = _PhoneAuthApiService;

  @POST('otp')
  Future<OTPResponse> sendOTP(
    @Body() String phoneNumber,
  );

  @POST('otp/verify-otp')
  Future<String> verifyOTP(
    @Body() VerifyOTPRequest verifyOTPRequest,
  );
}
