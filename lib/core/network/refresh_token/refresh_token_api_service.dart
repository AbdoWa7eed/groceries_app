import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/refresh_token/refresh_token_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:retrofit/http.dart';

part 'refresh_token_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RefreshTokenApiService {
  factory RefreshTokenApiService(Dio dio, {String? baseUrl}) =
      _RefreshTokenApiService;

  @POST('user/refresh-token')
  Future<RefreshTokenResponse> refreshToken(@Field() String refreshToken);
}
