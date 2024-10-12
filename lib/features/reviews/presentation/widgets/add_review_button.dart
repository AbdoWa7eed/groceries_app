import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/add_review/add_review_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/cubit/reviews/reviews_cubit.dart';
import 'package:groceries_app/features/reviews/presentation/widgets/add_review_bottom_sheet.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        final cubit = context.read<ReviewsCubit>();
        if (state is! ReviewsSuccess || cubit.isUserReviewed) {
          return const SizedBox.shrink();
        }

        return IconButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    final cubit = context.read<ReviewsCubit>();
    initAddReviewDi();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AddReviewCubit>(
              create: (context) => getIt()..setProductId(cubit.productId),
            ),
            BlocProvider<ReviewsCubit>.value(
              value: getIt(),
            ),
          ],
          child: const AddReviewBottomSheet(),
        );
      },
    );
  }
}
