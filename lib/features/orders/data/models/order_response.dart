import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/orders/data/models/order_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable(createToJson: false)
class OrderResponse extends BaseResponse {
  @JsonKey(name: "data")
  final OrderResponseModel? order;

  OrderResponse({required this.order, required super.message});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}
