import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/password_field_widget.dart';
import 'package:groceries_app/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:groceries_app/features/change_password/presentation/widgets/change_password_button_widget.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PasswordFieldWidget(
                labelText: AppStrings.currentPassword,
                controller: _currentPasswordController,
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              PasswordFieldWidget(
                labelText: AppStrings.newPassword,
                controller: _newPasswordController,
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              PasswordFieldWidget(
                labelText: AppStrings.confirmPassword,
                validator: _confirmPasswordValidator,
                controller: _confirmPasswordController,
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              ChangePasswordButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ChangePasswordCubit>().changePassword(
                          currentPassword: _currentPasswordController.text,
                          newPassword: _newPasswordController.text,
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
    if (value != _newPasswordController.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }
}
