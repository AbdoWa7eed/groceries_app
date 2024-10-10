import 'package:json_annotation/json_annotation.dart';

part 'add_review_request.g.dart';

@JsonSerializable(createFactory: false)
class ReviewRequest {
  final int productId;
  final double rating;
  final String reviewDescription;

  ReviewRequest(
      {required this.productId,
      required this.rating,
      required this.reviewDescription});

  Map<String, dynamic> toJson() => _$ReviewRequestToJson(this);
}
