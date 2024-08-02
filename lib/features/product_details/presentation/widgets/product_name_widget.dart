import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ProductDetailsNameWidget extends StatefulWidget {
  const ProductDetailsNameWidget({super.key});

  @override
  State<ProductDetailsNameWidget> createState() =>
      _ProductDetailsNameWidgetState();
}

class _ProductDetailsNameWidgetState extends State<ProductDetailsNameWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Watermelon',
              style: StylesManager.bold24,
            ),
            const SizedBox(
              height: AppSize.s4,
            ),
            Text(
              'Sweet and refreshing watermelon',
              style: StylesManager.medium16
                  .copyWith(color: ColorManager.darkGray),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
          color: isFavorite ? ColorManager.error : null,
        ),
      ],
    );
  }
}
