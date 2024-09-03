import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable(createToJson: false)
class CartResponse extends BaseResponse {
  final CartResponseData? data;
  CartResponse({
    required super.message,
    required this.data,
  });
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartResponseData {
  int cartId;
  List<CartItemModel> cartItems;
  CartResponseData({
    required this.cartId,
    required this.cartItems,
  });

  factory CartResponseData.fromJson(Map<String, dynamic> json) =>
      _$CartResponseDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartItemModel {
  ProductModel product;
  int quantity;
  CartItemModel({
    required this.product,
    required this.quantity,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
