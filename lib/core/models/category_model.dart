import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoryModel {
  final int? categoryId;
  final String? name;
  final String? imageUrl;

  CategoryModel(
      {required this.categoryId,
      required this.name,
      required this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
