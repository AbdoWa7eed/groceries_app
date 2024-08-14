import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerContainer extends StatelessWidget {
  const CustomShimmerContainer(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.shimmerBase,
      highlightColor: ColorManager.shimmerHighlight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorManager.shimmerBase,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    );
  }
}
