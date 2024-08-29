import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_rounded_container.dart';

class CartItemCounterWidget extends StatefulWidget {
  const CartItemCounterWidget({super.key, required this.onQuantityChanged});

  final Function(int value) onQuantityChanged;

  @override
  State<CartItemCounterWidget> createState() => _CartItemCounterWidgetState();
}

class _CartItemCounterWidgetState extends State<CartItemCounterWidget> {
  int numberOfPieces = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomRoundedContainer(
              onTab: () {
                setState(() {
                  if (numberOfPieces != 1) {
                    numberOfPieces--;
                    widget.onQuantityChanged(numberOfPieces);
                  }
                });
              },
              size: AppSize.s40,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGray,
              child: const Icon(
                Icons.remove,
                color: ColorManager.gray,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Text(
              '$numberOfPieces',
              style: StylesManager.bold16,
            ),
          ),
          CustomRoundedContainer(
              onTab: () {
                setState(() {
                  if (numberOfPieces != 50) {
                    numberOfPieces++;
                    widget.onQuantityChanged(numberOfPieces);
                  }
                });
              },
              size: AppSize.s40,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGray,
              child: const Icon(
                Icons.add,
                color: ColorManager.primary,
              )),
        ],
      ),
    );
  }
}
