import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class PickImageBottomSheetWidget extends StatelessWidget {
  const PickImageBottomSheetWidget({
    super.key,
    required this.onCameraTapped,
    required this.onGalleryTapped,
  });

  final Function onGalleryTapped;
  final Function onCameraTapped;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.white,
        child: Wrap(
          children: [
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
              leading: const Icon(Icons.camera),
              title: const Text(AppStrings.fromGallery),
              onTap: () {
                context.pop();
                onGalleryTapped.call();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text(AppStrings.fromCamera),
              onTap: () {
                context.pop();
                onCameraTapped.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
