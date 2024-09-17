import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_model.g.dart';

@JsonSerializable(createFactory: false)
class OrderRequestModel {
  final String paymentMethod;
  @JsonKey(includeIfNull: false)
  final String? shippingAddress;

  OrderRequestModel({
    required this.paymentMethod,
    required this.shippingAddress,
  });

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}
