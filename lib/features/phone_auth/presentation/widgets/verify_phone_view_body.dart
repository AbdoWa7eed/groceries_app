import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/code_input_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/custom_header_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/resend_verify_code_widget.dart';

class VerifyPhoneViewBody extends StatefulWidget {
  const VerifyPhoneViewBody({super.key});

  @override
  State<VerifyPhoneViewBody> createState() => _VerifyPhoneViewBodyState();
}

class _VerifyPhoneViewBodyState extends State<VerifyPhoneViewBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomHeaderWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p26, vertical: AppPadding.p18),
            child: Column(
              children: [
                const Text(AppStrings.verification,
                    style: StylesManager.bold24),
                Text(AppStrings.verificationSubtitle,
                    style: StylesManager.regular18
                        .copyWith(color: ColorManager.darkGray)),
                const SizedBox(
                  height: AppSize.s20,
                ),
                CodeInputWidget(
                  controller: _controller,
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                VerifyResendButtonsWidget(
                  code: _controller.text,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
