import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/shop/presentation/widgets/shimmer/section_shimmer_widget.dart';
import 'package:groceries_app/core/widgets/shimmer_container_widget.dart';

class ShopShimmerLoading extends StatelessWidget {
  const ShopShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.p20,
          horizontal: AppPadding.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmerContainer(
              height: AppSize.s45,
              width: double.infinity,
            ),
            SizedBox(height: AppPadding.p16),
            CustomShimmerContainer(
              height: AppSize.s120,
              width: double.infinity,
            ),
            SectionShimmerWidget(),
            SectionShimmerWidget()
          ],
        ),
      ),
    );
  }
}
