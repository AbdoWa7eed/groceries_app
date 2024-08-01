// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ProductsRequestParamsToJson(
    ProductsRequestParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('skip', instance.skip);
  writeNotNull('take', instance.take);
  writeNotNull('searchText', instance.searchText);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('categoryName', instance.categoryName);
  return val;
}
