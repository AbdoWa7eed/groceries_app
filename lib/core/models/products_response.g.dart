// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ProductsResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

ProductsResponseData _$ProductsResponseDataFromJson(
        Map<String, dynamic> json) =>
    ProductsResponseData(
      itemsCount: (json['itemsCount'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      quantityInStock: (json['quantityInStock'] as num?)?.toInt(),
      description: json['description'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
    );
