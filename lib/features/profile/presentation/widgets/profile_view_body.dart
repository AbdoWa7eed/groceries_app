import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:groceries_app/features/profile/presentation/widgets/update_button_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImageWidget(),
                SizedBox(
                  height: AppSize.s40,
                ),
                CustomTextFormField(labelText: AppStrings.username),
                SizedBox(
                  height: AppSize.s40,
                ),
                CustomTextFormField(labelText: AppStrings.email),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: UpdateButtonWidget(),
        ),
      ],
    );
  }
}
