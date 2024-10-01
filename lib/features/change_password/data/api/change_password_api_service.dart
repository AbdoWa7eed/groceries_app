import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/change_password/data/models/change_password_request.dart';
import 'package:retrofit/http.dart';

part 'change_password_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChangePasswordApiService {
  factory ChangePasswordApiService(Dio dio, {String? baseUrl}) =
      _ChangePasswordApiService;

  @POST('user/change_password')
  Future<BaseResponse> changePassword(@Body() ChangePasswordRequest request);
}
