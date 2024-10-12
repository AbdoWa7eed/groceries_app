import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/add_review/add_review_cubit.dart';

class SubmitReviewButton extends StatelessWidget {
  const SubmitReviewButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddReviewCubit, AddReviewState>(
      builder: (context, state) {
        return CustomElevatedButtonWidget(
          isLoading: state is AddReviewLoading,
          onPressed: onPressed,
          child: const Text(
            AppStrings.submitReview,
            style: StylesManager.semiBold18,
          ),
        );
      },
    );
  }
}
