import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/edit_review_bottom_sheet.dart';

class ReviewerNameWidget extends StatelessWidget {
  const ReviewerNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'John Doe',
          style: StylesManager.bold16,
        ),

        //TODD : SHOW THE EDIT BUTTON WHEN IT'S USER'S REVIEW
        if (true) ...[
          Visibility(
            visible: true,
            child: Container(
              margin: const EdgeInsetsDirectional.only(
                start: AppMargin.m8,
              ),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const EditReviewBottomSheet();
                      },
                    );
                  },
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.p8,
                    vertical: AppPadding.p4,
                  ),
                  iconSize: AppSize.s16,
                  icon: const Icon(
                    Icons.edit_rounded,
                    color: ColorManager.primary,
                  )),
            ),
          ),
        ],
      ],
    );
  }
}
