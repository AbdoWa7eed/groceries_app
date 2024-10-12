import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/add_review/add_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';

class AddReviewListener extends StatelessWidget {
  const AddReviewListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddReviewCubit, AddReviewState>(
      listener: (context, state) {
        if (state is AddReviewSuccess) {
          context.pop();
          context.read<ReviewsCubit>().getReviews();
        }
        if (state is AddReviewError) {
          showToast(text: state.message);
        }
      },
      child: child,
    );
  }
}
