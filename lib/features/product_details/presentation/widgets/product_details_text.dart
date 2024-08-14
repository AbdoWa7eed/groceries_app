import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/fade_transition.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/animated_arrow_widget.dart';

class ProductDetailsTextWidget extends StatefulWidget {
  const ProductDetailsTextWidget({super.key});

  @override
  State<ProductDetailsTextWidget> createState() =>
      _ProductDetailsTextWidgetState();
}

class _ProductDetailsTextWidgetState extends State<ProductDetailsTextWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.productDetails,
              style:
                  StylesManager.semiBold18.copyWith(color: ColorManager.dark),
            ),
            AnimatedArrowWidget(
              onTurn: (isTurned) {
                setState(() {
                  isVisible = isTurned;
                });
              },
            ),
          ],
        ),
        Visibility(
          visible: isVisible,
          child: CustomFadeTransition(
            child: Text(
              context.read<ProductDetailsCubit>().productDetailsEntity
                  .productDetails,
              style: StylesManager.medium14,
            ),
          ),
        ),
      ],
    );
  }
}
