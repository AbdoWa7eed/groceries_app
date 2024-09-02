import 'package:json_annotation/json_annotation.dart';

part 'cart_request_body.g.dart';

@JsonSerializable(createFactory: false)
class CartRequestBody {
  int productId;
  int quantity;

  CartRequestBody({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => _$CartRequestBodyToJson(this);
}
