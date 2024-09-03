import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/add_item_to_cart_listener.dart';
import 'package:groceries_app/core/widgets/custom_search_field.dart';
import 'package:groceries_app/features/shop/presentation/widgets/banners_carousel_slider_widget.dart';
import 'package:groceries_app/features/shop/presentation/widgets/best_selling_widget.dart';
import 'package:groceries_app/features/shop/presentation/widgets/exclusive_offers_widget.dart';
import 'package:groceries_app/features/shop/presentation/widgets/groceries_section_widget.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddItemToCartListener(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.p20,
          horizontal: AppPadding.p16,
        ),
        child: Column(
          children: [
            CustomSearchField(),
            SizedBox(height: AppSize.s16),
            BannersCarouselWidget(),
            ExclusiveOffersSectionWidget(),
            BestSellingSectionWidget(),
            GroceriesSectionWidget(),
          ],
        ),
      ),
    );
  }
}
