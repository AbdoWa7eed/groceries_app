import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/core/widgets/password_field_widget.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/widgets/auth_texts_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_logo_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:groceries_app/features/auth/presentation/widgets/toggle_screens_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  @override
  initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
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
                    controller: _usernameController,
                    validator: ValidationBuilder()
                        .minLength(UiConstants.usernameMinLength)
                        .build(),
                    labelText: AppStrings.username,
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    validator: ValidationBuilder().email().build(),
                    labelText: AppStrings.email,
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  PasswordFieldWidget(
                    labelText: AppStrings.password,
                    controller: _passwordController,
                  ),
                  const CustomRichTextWidget(),
                  CustomElevatedButtonWidget(
                    isLoading: state is RegisterLoadingState,
                    verticalPadding: AppPadding.p8,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.register(
                            username: _usernameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text);
                      }
                    },
                    child: const Text(
                      AppStrings.signUp,
                      style: StylesManager.semiBold18,
                    ),
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
      },
    );
  }
}
