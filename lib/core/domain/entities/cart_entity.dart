import 'package:groceries_app/core/domain/entities/product_entity.dart';

class CartEntity {
  final int cartId;
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartId, required this.cartItems});
}

class CartItemEntity {
  final ProductEntity product;
  final int quantity;
  CartItemEntity({required this.product, required this.quantity});
}
