import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/review_item_widget.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p18,
      ),
      itemBuilder: (context, index) {
        return const ReviewItemWidget();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: AppSize.s12,
        );
      },
      itemCount: 8,
    );
  }
}
