import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/data/models/cart/cart_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:retrofit/http.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @POST('cart')
  Future<BaseResponse> addToCart(@Body() CartRequestBody cartItem);

  @PUT('cart')
  Future<BaseResponse> updateItemQuantity(@Body() CartRequestBody cartItem);

  @PUT('cart/add_all')
  Future<BaseResponse> addAllToCart(
      @Field('items') List<CartRequestBody> cartItemsList);

  @GET('cart')
  Future<CartResponse> getCart();

  @DELETE('cart')
  Future<BaseResponse> removeFromCart(@Field() int productId);
}
