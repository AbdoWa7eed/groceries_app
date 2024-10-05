import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderResponseModel {
  final int? orderId;
  final String? orderDate;
  final String? shippingDate;
  final String? shippingAddress;
  final int? userId;
  final String? status;
  final String? paymentMethod;
  final String? paymentStatus;
  final double? totalPrice;
  final List<OrderItemResponse>? orderItems;
  final String? paymentLink;

  OrderResponseModel(
      {required this.orderId,
      required this.orderDate,
      required this.shippingDate,
      required this.shippingAddress,
      required this.userId,
      required this.status,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.totalPrice,
      required this.orderItems,
      required this.paymentLink});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrderItemResponse {
  final int? orderId;
  final ProductModel? product;
  final int? quantity;

  OrderItemResponse(
      {required this.orderId, required this.product, required this.quantity});

  factory OrderItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderItemResponseFromJson(json);
}
