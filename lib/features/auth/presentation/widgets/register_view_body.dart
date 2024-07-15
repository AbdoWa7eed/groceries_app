import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/features/auth/presentation/widgets/auth_texts_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_loading_button.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_logo_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:groceries_app/features/auth/presentation/widgets/password_suffix_icon.dart';
import 'package:groceries_app/features/auth/presentation/widgets/toggle_screens_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late bool _isObscure;
  late final GlobalKey<FormState> _formKey;
  @override
  initState() {
    super.initState();
    _isObscure = true;
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthLogoWidget(),
              const AuthTextWidget(
                title: AppStrings.signUp,
                subtitleText: AppStrings.signUpSubtitle,
              ),
              CustomTextFormField(
                validator: ValidationBuilder()
                    .minLength(UiConstants.usernameMinLength)
                    .build(),
                labelText: AppStrings.userName,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomTextFormField(
                validator: ValidationBuilder().email().build(),
                labelText: AppStrings.email,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomTextFormField(
                validator: ValidationBuilder()
                    .minLength(UiConstants.passwordMinLength)
                    .maxLength(UiConstants.passwordMaxLength)
                    .build(),
                obscureText: _isObscure,
                labelText: AppStrings.password,
                suffix: PasswordSuffixIcon(
                  onTap: (value) {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              const CustomRichTextWidget(),
              CustomLoadingButton(
                condition: false,
                text: AppStrings.signUp,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              ToggleAuthScreensWidget(
                  onButtonPressed: () {
                    context.pop();
                  },
                  descriptionText: AppStrings.alreadyHaveAnAccount,
                  buttonText: AppStrings.login),
            ],
          ),
        ),
      ),
    );
  }
}
