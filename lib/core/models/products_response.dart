import 'package:json_annotation/json_annotation.dart';
part 'products_response.g.dart';

@JsonSerializable(createToJson: false)
class ProductsResponse {
  final String message;
  final ProductsResponseData? data;

  ProductsResponse({
    required this.message,
    required this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductsResponseData {
  int? itemsCount;
  List<ProductModel>? items;

  ProductsResponseData({
    this.itemsCount,
    this.items,
  });

  factory ProductsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductModel {
  final int? productId;
  final String? name;
  final int? quantityInStock;
  final String? description;
  final double? unitPrice;
  final int? rate;
  final String? imageUrl;
  final int? discountPercentage;

  ProductModel({
    this.productId,
    this.name,
    this.quantityInStock,
    this.description,
    this.unitPrice,
    this.rate,
    this.imageUrl,
    this.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
