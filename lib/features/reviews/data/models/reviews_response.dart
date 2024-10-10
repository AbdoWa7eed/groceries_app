import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/reviews/data/models/review_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_response.g.dart';

@JsonSerializable(createToJson: false)
class ReviewsResponse extends BaseResponse {
  final ReviewsResponseData? data;

  ReviewsResponse({required super.message, required this.data});

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReviewsResponseData {
  @JsonKey(name: 'itemCount')
  final int? reviewsCount;
  @JsonKey(name: 'items')
  final List<ReviewResponseModel>? reviews;

  ReviewsResponseData({required this.reviewsCount, required this.reviews});

  factory ReviewsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseDataFromJson(json);
}
