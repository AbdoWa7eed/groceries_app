import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/add_review/add_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/views/add_review_listener.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/bottom_sheet_shape_container.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/review_bottom_sheet_text_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/submit_review_button.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/type_review_field.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({super.key});

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _reviewController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _reviewController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddReviewCubit>();
    return AddReviewListener(
      child: Form(
        key: _formKey,
        child: BottomSheetShapeContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ReviewBottomSheetTextWidget(
                title: AppStrings.leaveReview,
                subtitle: AppStrings.addReviewSubtitle,
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
              SubmitReviewButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  cubit.addReview(
                    reviewDescription: _reviewController.text.trim(),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
