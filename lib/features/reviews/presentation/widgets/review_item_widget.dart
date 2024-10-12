import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/reviewer_image_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/reviewer_name_widget.dart';
import 'package:readmore/readmore.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewerImageWidget(imageUrl: review.imageUrl),
        const SizedBox(width: AppSize.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReviewerNameWidget(
                    review: review,
                  ),
                  Text(
                    review.reviewDate.formatedDateTime,
                    style: StylesManager.regular14,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              CustomRatingWidget(initialRating: review.rating),
              const SizedBox(
                height: AppSize.s4,
              ),
              ReadMoreText(
                review.reviewDescription,
                colorClickableText: ColorManager.primary,
                trimMode: TrimMode.Line,
                trimLines: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
