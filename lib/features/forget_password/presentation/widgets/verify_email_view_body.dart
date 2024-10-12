import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/code_input_widget.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:groceries_app/features/forget_password/presentation/widgets/forget_password_feature_button.dart';

class VerifyEmailViewBody extends StatefulWidget {
  const VerifyEmailViewBody({super.key});

  @override
  State<VerifyEmailViewBody> createState() => _VerifyEmailViewBodyState();
}

class _VerifyEmailViewBodyState extends State<VerifyEmailViewBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.enterEmailCode, style: StylesManager.bold18),
            const SizedBox(height: AppSize.s20),
            CodeInputWidget(controller: _controller),
            const SizedBox(height: AppSize.s20),
            ForgetPasswordFeatureButton(
              text: AppStrings.verify,
              onPressed: () {
                if (_controller.text.length < 6) {
                  showSnackBar(context, text: AppStrings.codeIsNotCompleted);
                } else {
                  context
                      .read<ForgetPasswordCubit>()
                      .verifyEmail(_controller.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
