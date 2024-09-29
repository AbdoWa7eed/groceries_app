import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/account/presentation/widgets/user_info_text_widget.dart';

class AccountViewHeaderWidget extends StatelessWidget {
  const AccountViewHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p18,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: ColorManager.primaryWith10Opacity,
                borderRadius: BorderRadius.circular(AppSize.s12)),
            child: const CustomNetworkImage(
              imageUrl:
                  'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=996&t=st=1708437458~exp=1708438058~hmac=6dfecfd79c582d6d443390a24c2b735945e4cca54aec20bb0879c2d7da238d7e',
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(
            width: AppSize.s18,
          ),
          const UserInfoTextWidget(),
        ],
      ),
    );
  }
}
