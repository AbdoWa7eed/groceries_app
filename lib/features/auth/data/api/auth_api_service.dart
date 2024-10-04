import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/auth/auth_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:retrofit/retrofit.dart';

import '../models/register_request.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('user/login')
  Future<AuthResponse> login(
    @Body() LoginRequest request,
  );

  @POST('user/register')
  Future<AuthResponse> register(
    @Body() RegisterRequest request,
  );
}
