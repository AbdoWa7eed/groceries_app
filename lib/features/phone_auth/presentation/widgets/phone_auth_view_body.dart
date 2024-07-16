import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/custom_header_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/input_phone_filed.dart';

class PhoneAuthViewBody extends StatelessWidget {
  const PhoneAuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHeaderWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p26, vertical: AppPadding.p28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.enterPhoneNumber, style: StylesManager.bold24),
                InputPhoneField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
