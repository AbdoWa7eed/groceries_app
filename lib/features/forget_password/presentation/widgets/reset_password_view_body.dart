import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/password_field_widget.dart';
import 'package:groceries_app/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:groceries_app/features/forget_password/presentation/widgets/forget_password_feature_button.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.resetPassword, style: StylesManager.bold18),
              const SizedBox(height: AppSize.s20),
              PasswordFieldWidget(
                  controller: _newPasswordController,
                  labelText: AppStrings.newPassword),
              const SizedBox(height: AppSize.s20),
              PasswordFieldWidget(
                  controller: _confirmPasswordController,
                  validator: _confirmPasswordValidator,
                  labelText: AppStrings.confirmPassword),
              const SizedBox(height: AppSize.s20),
              ForgetPasswordFeatureButton(
                text: AppStrings.resetPassword,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ForgetPasswordCubit>().resetPassword(
                          _newPasswordController.text,
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

  String? _confirmPasswordValidator(String? value) {
    if (_newPasswordController.text != value) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }
}
