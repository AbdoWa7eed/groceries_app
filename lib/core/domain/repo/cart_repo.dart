import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';

abstract class CartRepository {
  ResultFuture<CartEntity> getCart();
  ResultFuture<String> addToCart(CartRequestBody cartRequestBody);
  ResultFuture<String> addAllToCart(List<CartRequestBody> cartRequestBodyList);
  ResultFuture<String> removeFromCart(int productId);
  ResultFuture<String> updateItemQuantity(CartRequestBody cartRequestBody);
}
