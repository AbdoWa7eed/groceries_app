import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_tracker_dialog.dart';

class OrderButtonsWidget extends StatelessWidget {
  const OrderButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s45,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const OrderTrackingDialog(
                        currentStatus: OrderStatus.delivered,
                      );
                    },
                  );
                },
                child: const Text(
                  AppStrings.trackOrder,
                  style: StylesManager.semiBold14,
                )),
          ),
          const Visibility(
              //TODO: CHECK ORDER STATUS
              visible: true,
              child: SizedBox(width: AppSize.s20)),
          Visibility(
            //TODO: CHECK ORDER STATUS
            visible: true,
            child: Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8)),
                    side: const BorderSide(
                      color: ColorManager.primary,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    AppStrings.cancel,
                    style: StylesManager.semiBold14
                        .copyWith(color: ColorManager.primary),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
