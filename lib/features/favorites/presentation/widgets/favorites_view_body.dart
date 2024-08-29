import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

import 'favorites_list_view.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const FavoritesListView(),
          CustomElevatedButtonWidget(
              verticalPadding: AppPadding.p12,
              child: const Text(
                AppStrings.addAllToCart,
                style: StylesManager.semiBold18,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
