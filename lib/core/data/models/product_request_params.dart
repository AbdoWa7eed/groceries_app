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
    this.skip,
    this.take,
    this.searchText,
    this.categoryId,
    this.categoryName,
  });

  Map<String, dynamic> toJson() => _$ProductsRequestParamsToJson(this);
}
