import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/profile/data/models/update_user_request.dart';
import 'package:retrofit/http.dart';

import '../../../../core/data/models/profile/profile_response.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String? baseUrl}) = _ProfileApiService;

  @PUT("user/update_profile")
  Future<ProfileResponse> updateProfile(
      @Body() UpdateUserRequest updateLocationRequest);
}
