import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'product_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String? baseUrl}) = _ProductApiService;

  @GET('products')
  Future<ProductsResponse> getProducts(
    @Queries() ProductsRequestParams params,
  );
}
