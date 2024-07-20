import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class SelectLocationViewBody extends StatelessWidget {
  const SelectLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p20, horizontal: AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: SvgPicture.asset(AssetsManager.location)),
          const Text(
            AppStrings.selectLocation,
            style: StylesManager.semiBold26,
          ),
          const SizedBox(height: AppSize.s12),
          const Text(
            AppStrings.selectLocationSubtitle,
            textAlign: TextAlign.center,
            style: StylesManager.medium16,
          ),
          CustomElevatedButtonWidget(
              child: const Text(AppStrings.selectLocation,
                  style: StylesManager.regular18),
              onPressed: () {
                context.push(Routes.mapRoute);
              }),
        ],
      ),
    );
  }
}
