import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        log(direction.index.toString());
      },
      key: const Key('1'),
      child: GestureDetector(
        onTap: () {},
        child: const SizedBox(
          height: 110,
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: 'imageUrl',
                height: 80,
                width: 100,
              ),
              SizedBox(width: AppSize.s12),
              Expanded(
                child: ProductTitleWidget(
                    description: 'description',
                    productName: 'Banana Apple GOGOGO SHSHSH'),
              ),
              SizedBox(width: AppSize.s12),
              Row(
                children: [
                  Text(
                    '\$5646',
                    style: StylesManager.bold16,
                  ),
                  SizedBox(width: AppSize.s12),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorManager.dark,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
