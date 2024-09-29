import 'package:groceries_app/core/data/mapper/product_mapper.dart';
import 'package:groceries_app/core/data/models/cart/cart_response.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';

extension CartMapper on CartResponseData {
  CartEntity toEntity() {
    return CartEntity(
      cartId: cartId,
      cartItems: cartItems.map((e) => e.toEntity()).toList(),
    );
  }
}

extension CartItemMapper on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      product: product.toEntity(),
      quantity: quantity,
    );
  }
}
