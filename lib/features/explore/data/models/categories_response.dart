import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_response.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesResponse extends BaseResponse {
  CategoriesResponseData? data;

  CategoriesResponse({required super.message, required this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
}


@JsonSerializable(createToJson: false)
class CategoriesResponseData {
  int? itemsCount;
  List<CategoryModel>? items;

  CategoriesResponseData({this.itemsCount, this.items});

  factory CategoriesResponseData.fromJson(Map<String, dynamic> json) => _$CategoriesResponseDataFromJson(json);
  
}
