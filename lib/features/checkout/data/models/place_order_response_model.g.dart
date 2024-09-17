// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderResponseModel _$PlaceOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderResponseModel(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PlaceOrderResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

PlaceOrderResponseData _$PlaceOrderResponseDataFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderResponseData(
      orderId: (json['orderId'] as num).toInt(),
      paymentLink: json['paymentLink'] as String?,
    );
