import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/orders/data/models/order_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_response.g.dart';

@JsonSerializable(createToJson: false)
class OrdersResponse extends BaseResponse {
  final OrdersResponseData? data;

  OrdersResponse({required super.message, required this.data});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrdersResponseData {
  @JsonKey(name: "items")
  final List<OrderResponseModel> orders;
  final int itemCount;

  OrdersResponseData({required this.orders, required this.itemCount});

  factory OrdersResponseData.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseDataFromJson(json);
}
