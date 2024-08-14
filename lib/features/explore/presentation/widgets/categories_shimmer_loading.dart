import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/shimmer_container_widget.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: Column(
          children: [
            const CustomShimmerContainer(
              height: AppSize.s45,
              width: double.infinity,
            ),
            GridView.builder(
              padding: const EdgeInsetsDirectional.only(
                top: AppPadding.p16,
              ),
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: AppSize.s14,
                  mainAxisSpacing: AppSize.s14),
              itemBuilder: (context, index) {
                return const CustomShimmerContainer(
                  height: 260,
                  width: double.infinity,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
