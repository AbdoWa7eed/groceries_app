import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/shimmer_container_widget.dart';

class SectionShimmerWidget extends StatelessWidget {
  const SectionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomShimmerContainer(
            height: AppSize.s20,
            width: AppSize.s150,
          ),
          const SizedBox(height: AppSize.s16),
          SizedBox(
            height: 250,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: AppSize.s8,
                );
              },
              itemBuilder: (context, index) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmerContainer(
                      height: AppSize.s150,
                      width: AppSize.s150,
                    ),
                    SizedBox(height: AppSize.s8),
                    CustomShimmerContainer(
                      height: AppSize.s20,
                      width: AppSize.s100,
                    ),
                    SizedBox(height: AppSize.s8),
                    CustomShimmerContainer(
                      height: AppSize.s20,
                      width: AppSize.s65,
                    ),
                    SizedBox(height: AppSize.s8),
                    CustomShimmerContainer(
                      height: AppSize.s20,
                      width: AppSize.s40,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
