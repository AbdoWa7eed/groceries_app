import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/reviewer_name_widget.dart';
import 'package:readmore/readmore.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: AppSize.s20,
          child: ClipOval(
            child: CustomNetworkImage(
              imageUrl: 'https://i.pravatar.cc/300',
            ),
          ),
        ),
        SizedBox(width: AppSize.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReviewerNameWidget(),
                  Text(
                    'Today',
                    style: StylesManager.regular14,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              CustomRatingWidget(initialRating: 3),
              SizedBox(
                height: AppSize.s4,
              ),
              ReadMoreText(
                "Lorem Ipsum is simply dummy text of the printing"
                " and typesetting industry. Lorem Ipsum has been the "
                "industry's standard dummy text ever since the 1500s, "
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                "It has survived not only five centuries,",
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
