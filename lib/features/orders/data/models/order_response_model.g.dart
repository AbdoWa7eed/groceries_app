// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      orderId: (json['orderId'] as num?)?.toInt(),
      orderDate: json['orderDate'] as String?,
      shippingDate: json['shippingDate'] as String?,
      shippingAddress: json['shippingAddress'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      status: json['status'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentLink: json['paymentLink'] as String?,
    );

OrderItemResponse _$OrderItemResponseFromJson(Map<String, dynamic> json) =>
    OrderItemResponse(
      orderId: (json['orderId'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
    );
