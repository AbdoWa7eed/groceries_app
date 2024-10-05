import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Processing',
              style: StylesManager.bold16,
            ),
            Text(
              '#1623',
              style: StylesManager.regular14,
            ),
          ],
        ),
        SizedBox(height: AppSize.s20),
        Row(
          children: [
            Text(
              '\$35.6',
              style: StylesManager.bold16,
            ),
            SizedBox(
              height: AppSize.s16,
              child: VerticalDivider(
                color: ColorManager.lightGray,
                thickness: 1,
              ),
            ),
            Text(
              '3 Items',
              style: StylesManager.regular14,
            ),
          ],
        ),
      ],
    );
  }
}
