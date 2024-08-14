import 'package:json_annotation/json_annotation.dart';
part 'product_request_params.g.dart';

@JsonSerializable(createFactory: false , includeIfNull: false)
class ProductsRequestParams {
  int? skip;
  int? take;
  String? searchText;
  int? categoryId;
  String? categoryName;

  ProductsRequestParams({
   required this.skip,
   required this.take,
   required this.searchText,
   required this.categoryId,
   required this.categoryName,
  });

  Map<String, dynamic> toJson() => _$ProductsRequestParamsToJson(this);
}
