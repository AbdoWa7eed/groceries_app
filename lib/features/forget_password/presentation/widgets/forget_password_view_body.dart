import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:groceries_app/features/forget_password/presentation/widgets/forget_password_feature_button.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _controller;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
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
                controller: _controller,
                validator: ValidationBuilder().email().build(),
                labelText: AppStrings.email,
              ),
              const SizedBox(height: AppSize.s20),
              ForgetPasswordFeatureButton(
                text: AppStrings.sendVerificationCode,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<ForgetPasswordCubit>()
                        .sendEmailVerificationCode(
                          _controller.text.trim(),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
