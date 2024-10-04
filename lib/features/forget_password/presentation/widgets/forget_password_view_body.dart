import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.enterYourEmail,
                  style: StylesManager.bold18),
              const SizedBox(height: AppSize.s20),
              CustomTextFormField(
                validator: ValidationBuilder().email().build(),
                labelText: AppStrings.email,
              ),
              const SizedBox(height: AppSize.s20),
              CustomElevatedButtonWidget(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      context.push(Routes.verifyEmail);
                    }
                  },
                  child: const Text(
                    AppStrings.sendVerificationCode,
                    style: StylesManager.semiBold18,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
