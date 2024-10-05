import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/orders/presentation/widgets/timeline_item_widget.dart';

class OrderTrackingDialog extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderTrackingDialog({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.orderTracking,
              style: StylesManager.semiBold22,
            ),
            const SizedBox(height: AppPadding.p12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: statuses.length,
              itemBuilder: (context, index) {
                return TimelineItem(
                  status: statuses[index],
                  currentStatus: currentStatus,
                );
              },
            ),
            const SizedBox(height: AppPadding.p12),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              child: const Text(
                AppStrings.close,
                style: StylesManager.semiBold18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<OrderStatus> get statuses => OrderStatus.values;
}
