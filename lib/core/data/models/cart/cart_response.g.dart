// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CartResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

CartResponseData _$CartResponseDataFromJson(Map<String, dynamic> json) =>
    CartResponseData(
      cartId: (json['cartId'] as num).toInt(),
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );
