import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/features/shop/presentation/widgets/products_list_view.dart';
import 'package:groceries_app/features/shop/presentation/widgets/section_text_widget.dart';

class GroceriesSectionWidget extends StatelessWidget {
  const GroceriesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTextWidget(
          text: AppStrings.groceries,
          onSeeAllPressed: () {},
        ),
        const ProductsListView(),
      ],
    );
  }
}
