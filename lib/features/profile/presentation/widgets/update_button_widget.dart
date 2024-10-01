import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: CustomElevatedButtonWidget(
          horizontalPadding: AppPadding.p20,
          onPressed: () {},
          child: const Text(
            AppStrings.update,
            style: StylesManager.semiBold18,
          )),
    );
  }
}
