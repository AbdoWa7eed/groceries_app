import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/manage_review/manage_review_cubit.dart';

class ManageReviewButtons extends StatelessWidget {
  const ManageReviewButtons({super.key, required this.onUpdatePressed});

  final Function() onUpdatePressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageReviewCubit, ManageReviewState>(
      builder: (context, state) {
        final cubit = context.read<ManageReviewCubit>();
        if (state is ManageReviewLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p28),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Row(
          children: [
            Expanded(
              child: CustomElevatedButtonWidget(
                onPressed: onUpdatePressed,
                child: const Text(
                  AppStrings.update,
                  style: StylesManager.semiBold18,
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s20,
            ),
            Expanded(
              child: CustomElevatedButtonWidget(
                onPressed: () {
                  cubit.deleteReview();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(ColorManager.error),
                ),
                child: const Text(
                  AppStrings.delete,
                  style: StylesManager.semiBold18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
