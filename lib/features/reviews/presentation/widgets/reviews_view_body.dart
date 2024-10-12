import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/empty_screen_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/review_item_widget.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        final cubit = context.read<ReviewsCubit>();
        if (cubit.reviews.isEmpty) {
          return CustomEmptyScreen(
            text: AppStrings.noReviewsFound,
            onTryAgain: () => cubit.getReviews(),
          );
        }
        return ListView.separated(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p18,
          ),
          itemBuilder: (context, index) {
            return ReviewItemWidget(review: cubit.reviews[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: AppSize.s12,
            );
          },
          itemCount: cubit.reviews.length,
        );
      },
    );
  }
}
