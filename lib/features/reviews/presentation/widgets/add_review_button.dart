import 'package:flutter/material.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/add_review_bottom_sheet.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      //TODO : SHOW THE ADD REVIEW BUTTON WHEN USER'S HAS NO REVIEW
      visible: true,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddReviewBottomSheet();
            },
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
