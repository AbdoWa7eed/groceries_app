import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../models/requests/update_user_address_request.dart';
part 'update_address_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UpdateAddressApiService {
  factory UpdateAddressApiService(Dio dio, {String baseUrl}) =
      _UpdateAddressApiService;

  @PUT("user/update_profile")
  Future<void> updateAddress(
      @Body() UpdateUserAddressRequest updateLocationRequest);
}
