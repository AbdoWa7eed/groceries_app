import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/add_review_button.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: const [
          AddReviewButton(),
        ],
        title: const Text(
          AppStrings.reviews,
          style: StylesManager.semiBold26,
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              color: ColorManager.lightGray,
            )),
      ),
      body: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          if (state is ReviewsSuccess) {
            return const ReviewsViewBody();

          }
          if (state is ReviewsError) {
            return CustomErrorWidget(error: state.message);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
