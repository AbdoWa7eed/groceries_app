import 'package:groceries_app/core/data/models/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ReviewResponseModel {
  final int? productId;
  final double? rating;
  final DateTime? reviewDate;
  final String? reviewDescription;
  final UserResponse? user;

  ReviewResponseModel(
      {required this.productId,
      required this.rating,
      required this.reviewDate,
      required this.reviewDescription,
      required this.user});

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseModelFromJson(json);
}
