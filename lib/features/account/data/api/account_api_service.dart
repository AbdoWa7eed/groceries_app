import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/account/data/models/profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String? baseUrl}) = _AccountApiService;

  @POST('user/logout')
  Future<BaseResponse> logout();

  @GET('user/')
  Future<ProfileResponse> getProfile();
}
