import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/network/cart/cart_api_service.dart';

import '../models/cart/cart_response.dart';

abstract class CartDataSource {
  Future<CartResponse> getCart();
  Future<BaseResponse> addToCart(CartRequestBody cartRequestBody);
  Future<BaseResponse> addAllToCart(List<CartRequestBody> cartRequestBodyList);
  Future<BaseResponse> removeFromCart(int productId);
  Future<BaseResponse> updateItemQuantity(CartRequestBody cartRequestBody);
}

class CartDataSourceImpl implements CartDataSource {
  final CartApiService _cartApiService;

  CartDataSourceImpl(this._cartApiService);
  @override
  Future<BaseResponse> addAllToCart(
      List<CartRequestBody> cartRequestBodyList) async {
    return _cartApiService.addAllToCart(cartRequestBodyList);
  }

  @override
  Future<BaseResponse> addToCart(CartRequestBody cartRequestBody) {
    return _cartApiService.addToCart(cartRequestBody);
  }

  @override
  Future<CartResponse> getCart() {
    return _cartApiService.getCart();
  }

  @override
  Future<BaseResponse> removeFromCart(int productId) {
    return _cartApiService.removeFromCart(productId);
  }

  @override
  Future<BaseResponse> updateItemQuantity(CartRequestBody cartRequestBody) {
    return _cartApiService.updateItemQuantity(cartRequestBody);
  }
}
