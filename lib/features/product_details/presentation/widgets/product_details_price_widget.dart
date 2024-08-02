import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_rounded_container.dart';

class ProductDetailsPriceWidget extends StatefulWidget {
  const ProductDetailsPriceWidget({super.key, required this.price});
  final double price;

  @override
  State<ProductDetailsPriceWidget> createState() =>
      _ProductDetailsPriceWidgetState();
}

class _ProductDetailsPriceWidgetState extends State<ProductDetailsPriceWidget> {
  int numberOfPieces = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (numberOfPieces != 1) {
                        numberOfPieces--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: ColorManager.gray,
                  )),
              CustomRoundedContainer(
                  size: AppSize.s45,
                  backgroundColor: ColorManager.white,
                  borderColor: ColorManager.lightGray,
                  child: Text(
                    '$numberOfPieces',
                    style: StylesManager.bold16,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (numberOfPieces != 50) {
                        numberOfPieces++;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: ColorManager.primary,
                  )),
            ],
          ),
          Text('\$$_getPrice', style: StylesManager.bold24),
        ],
      ),
    );
  }

  String get _getPrice {
    return (widget.price * numberOfPieces).toStringAsFixed(2);
  }
}
