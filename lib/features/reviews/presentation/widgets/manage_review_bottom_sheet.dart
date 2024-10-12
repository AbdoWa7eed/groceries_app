import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/manage_review/manage_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/views/manage_review_listener.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/bottom_sheet_shape_container.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/manage_review_buttons.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/review_bottom_sheet_text_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/type_review_field.dart';

class EditReviewBottomSheet extends StatefulWidget {
  const EditReviewBottomSheet({super.key});

  @override
  State<EditReviewBottomSheet> createState() => _EditReviewBottomSheetState();
}

class _EditReviewBottomSheetState extends State<EditReviewBottomSheet> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _reviewController;

  @override
  void initState() {
    final cubit = context.read<ManageReviewCubit>();
    _formKey = GlobalKey<FormState>();
    _reviewController = TextEditingController()
      ..text = cubit.review.reviewDescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManageReviewCubit>();
    return ManageReviewListener(
      child: Form(
        key: _formKey,
        child: BottomSheetShapeContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ReviewBottomSheetTextWidget(
                title: AppStrings.editReview,
                subtitle: AppStrings.editReviewSubtitle,
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              CustomRatingWidget(
                size: AppSize.s30,
                initialRating: cubit.rating,
                onRatingUpdate: (value) {
                  cubit.rating = value;
                },
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              TypeReviewFormField(
                controller: _reviewController,
              ),
              ManageReviewButtons(
                onUpdatePressed: () {
                  if (_formKey.currentState!.validate()) {
                    cubit.updateReview(
                      reviewDescription: _reviewController.text.trim(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
