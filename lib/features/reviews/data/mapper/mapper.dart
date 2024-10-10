import 'package:groceries_app/core/network/api_error_messages.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/reviews/data/models/review_response_model.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';

extension ReviewMapper on ReviewResponseModel {
  ReviewEntity toEntity() {
    if (user == null) {
      throw Failure.apiInternalError(ApiErrorMessages.unknownError);
    }
    return ReviewEntity(
      productId: productId.orZero(),
      rating: rating.orZero(),
      reviewDate: reviewDate ?? DateTime.now(),
      reviewDescription: reviewDescription.orEmpty(),
      username: user!.username.orEmpty(),
      userId: user!.userId.orZero(),
      imageUrl: user!.imageUrl.orEmpty(),
    );
  }
}
