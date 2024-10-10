import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/bottom_sheet_shape_container.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/review_bottom_sheet_text_widget.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/submit_review_button.dart';
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
    _formKey = GlobalKey<FormState>();
    _reviewController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
              initialRating: 0,
              onRatingUpdate: (value) {},
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            TypeReviewFormField(
              controller: _reviewController,
            ),
            SubmitReviewButton(
                text: AppStrings.updateReview,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    logInfo("SUBMIT");
                  }
                })
          ],
        ),
      ),
    );
  }
}
