import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/auth/auth_response.dart';
import 'package:groceries_app/core/data/models/otp/otp_response.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/forget_password/data/models/reset_password_request.dart';
import 'package:retrofit/http.dart';

part 'forget_password_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ForgetPasswordApiService {
  factory ForgetPasswordApiService(Dio dio, {String? baseUrl}) =
      _ForgetPasswordApiService;

  @POST('password/send-code')
  Future<OTPResponse> sendEmailVerificationCode(@Field() String email);

  @POST('password/verify-email')
  Future<OTPResponse> verifyEmail(@Body() VerifyOTPRequest verifyOTPRequest);

  @POST('password/reset')
  Future<AuthResponse> resetPassword(
      @Body() ResetPasswordRequest resetPasswordRequest);
}
