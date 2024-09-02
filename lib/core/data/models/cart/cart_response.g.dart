// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );

CartModel _$CarteResponseDataFromJson(Map<String, dynamic> json) => CartModel(
      cartId: (json['cartId'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
