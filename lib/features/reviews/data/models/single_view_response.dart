import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/reviews/data/models/review_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_view_response.g.dart';

@JsonSerializable(createToJson: false)
class SingleReviewResponse extends BaseResponse {
  SingleReviewResponse({required super.message, required this.review});

  @JsonKey(name: 'data')
  final ReviewResponseModel? review;

  factory SingleReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleReviewResponseFromJson(json);
}
