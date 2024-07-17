import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';

class CustomHeaderWidget extends StatefulWidget {
  const CustomHeaderWidget({super.key});

  @override
  State<CustomHeaderWidget> createState() => _CustomHeaderWidgetState();
}

class _CustomHeaderWidgetState extends State<CustomHeaderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetsManager.groceries),
        Visibility(
          visible: context.canPop(),
          child: const Positioned(
              top: kToolbarHeight / 2,
              left: AppSize.s8,
              child: CustomBackButton()),
        )
      ],
    );
  }
}
