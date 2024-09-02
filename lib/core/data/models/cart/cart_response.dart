import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable(createToJson: false)
class CartResponse extends BaseResponse {
  final CartModel? data;
  CartResponse({
    required super.message,
    required this.data,
  });
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartModel {
  int cartId;
  List<ProductModel> items;
  CartModel({
    required this.cartId,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CarteResponseDataFromJson(json);
}
