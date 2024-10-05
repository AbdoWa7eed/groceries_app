import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineItem extends StatelessWidget {
  final OrderStatus status;
  final OrderStatus currentStatus;

  const TimelineItem({
    super.key,
    required this.status,
    required this.currentStatus,
  });

  @override
  Widget build(BuildContext context) {
    final Map<OrderStatus, String> statusTexts = {
      OrderStatus.processing: currentStatus == OrderStatus.processing
          ? AppStrings.processingOrder
          : AppStrings.processedOrder,
      OrderStatus.shipped: AppStrings.shippedOrder,
      OrderStatus.delivered: AppStrings.deliveredOrder,
    };

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: AppSize.s24,
        height: AppSize.s24,
        indicator: CircleAvatar(backgroundColor: color),
      ),
      beforeLineStyle: LineStyle(
        color: color,
        thickness: AppSize.s4,
      ),
      afterLineStyle: LineStyle(
        color: color,
        thickness: AppSize.s4,
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status.name.capitalizeFirstLetter,
              style: isReached
                  ? StylesManager.semiBold18
                      .copyWith(color: ColorManager.primary)
                  : StylesManager.regular14,
            ),
            const SizedBox(height: AppPadding.p4),
            Visibility(
              visible: isReached,
              child: Text(
                statusTexts[status].toString(),
                style:
                    StylesManager.regular14.copyWith(color: ColorManager.gray),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool get isReached => status.index <= currentStatus.index;

  bool get isFirst => status == OrderStatus.processing;

  bool get isLast => status == OrderStatus.delivered;

  Color get color => isReached ? ColorManager.primary : ColorManager.lightGray;
}
