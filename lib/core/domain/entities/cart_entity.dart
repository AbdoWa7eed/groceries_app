import 'package:groceries_app/core/domain/entities/product_entity.dart';

class CartEntity {
  final int cartId;
  final List<ProductEntity> products;
  CartEntity({required this.cartId, required this.products});
}
