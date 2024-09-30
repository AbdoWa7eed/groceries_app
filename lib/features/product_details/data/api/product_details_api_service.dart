import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/product_details/data/models/product_details_response.dart';
import 'package:retrofit/http.dart';
part 'product_details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductDetailsApiService {
  factory ProductDetailsApiService(Dio dio, {String? baseUrl}) =
      _ProductDetailsApiService;

  @GET('products/{productId}')
  Future<ProductDetailsResponse> getProductDetails(
    @Path('productId') String productId,
  );
}
