import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/jwt_util.dart';
import 'package:groceries_app/features/reviews/domain/entities/review_entity.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/manage_review/manage_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/manage_review_bottom_sheet.dart';

class ReviewerNameWidget extends StatelessWidget {
  const ReviewerNameWidget({super.key, required this.review});
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          review.username,
          style: StylesManager.bold16,
        ),
        if (JWTUtil.isCurrentUser(review.userId)) ...[
          Container(
            margin: const EdgeInsetsDirectional.only(
              start: AppMargin.m8,
            ),
            child: IconButton(
                onPressed: () {
                  _showBottomSheet(context);
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
        ],
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    initManageReviewDi();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ManageReviewCubit>(
              create: (context) => getIt()..setReview(review),
            ),
            BlocProvider<ReviewsCubit>.value(
              value: getIt(),
            ),
          ],
          child: const EditReviewBottomSheet(),
        );
      },
    );
  }
}
