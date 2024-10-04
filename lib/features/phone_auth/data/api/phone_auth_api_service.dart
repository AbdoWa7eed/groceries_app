import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/otp/otp_response.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'phone_auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PhoneAuthApiService {
  factory PhoneAuthApiService(Dio dio, {String baseUrl}) = _PhoneAuthApiService;

  @POST('otp')
  Future<OTPResponse> sendOTP(
    @Field() String phoneNumber,
  );

  @POST('otp/verify-otp')
  Future<String> verifyOTP(
    @Body() VerifyOTPRequest verifyOTPRequest,
  );
}
