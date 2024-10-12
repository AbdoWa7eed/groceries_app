import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/manage_review/manage_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';

class ManageReviewListener extends StatelessWidget {
  const ManageReviewListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageReviewCubit, ManageReviewState>(
      listener: (context, state) {
        if (state is ManageReviewSuccess) {
          context.pop();
          context.read<ReviewsCubit>().getReviews();
        }
        if (state is ManageReviewError) {
          showToast(text: state.message);
        }
      },
      child: child,
    );
  }
}
