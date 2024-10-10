import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
    this.onRatingUpdate,
    required this.initialRating,
    this.size = AppSize.s24,
  });

  final Function(double value)? onRatingUpdate;
  final double initialRating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: onRatingUpdate == null,
      minRating: 0,
      initialRating: initialRating,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      glow: false,
      unratedColor: ColorManager.lightGray,
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star_rate_rounded,
          color: ColorManager.deepOrange,
        );
      },
      onRatingUpdate: onRatingUpdate ?? (value) {},
    );
  }
}
