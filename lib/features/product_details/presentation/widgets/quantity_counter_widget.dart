import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_rounded_container.dart';

class QuantityCounterWidget extends StatefulWidget {
  const QuantityCounterWidget({super.key, required this.onQuantityChanged});

  final Function(int value) onQuantityChanged;

  @override
  State<QuantityCounterWidget> createState() => _QuantityCounterWidgetState();
}

class _QuantityCounterWidgetState extends State<QuantityCounterWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (quantity != 1) {
                  quantity--;
                  widget.onQuantityChanged(quantity);
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
              '$quantity',
              style: StylesManager.bold16,
            )),
        IconButton(
            onPressed: () {
              setState(() {
                if (quantity != 50) {
                  quantity++;
                  widget.onQuantityChanged(quantity);
                }
              });
            },
            icon: const Icon(
              Icons.add,
              color: ColorManager.primary,
            )),
      ],
    );
  }
}
