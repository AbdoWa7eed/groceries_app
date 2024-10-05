// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      order: json['data'] == null
          ? null
          : OrderResponseModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
