// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : OrdersResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

OrdersResponseData _$OrdersResponseDataFromJson(Map<String, dynamic> json) =>
    OrdersResponseData(
      orders: (json['items'] as List<dynamic>)
          .map((e) => OrderResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCount: (json['itemCount'] as num).toInt(),
    );
