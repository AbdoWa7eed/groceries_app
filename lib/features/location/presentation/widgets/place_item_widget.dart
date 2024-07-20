import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class PlaceItemWidget extends StatelessWidget {
  const PlaceItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            color: ColorManager.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: AppSize.s20,
                  backgroundColor: ColorManager.primaryWith10Opacity,
                  child: Icon(Icons.place, color: ColorManager.primary),
                ),
                const SizedBox(
                  width: AppSize.s16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NAME",
                        overflow: TextOverflow.ellipsis,
                        style: StylesManager.semiBold18
                            .copyWith(color: ColorManager.dark),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      const Text(
                        "IT'S MY HOME ADDRESS",
                        style: StylesManager.regular16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
