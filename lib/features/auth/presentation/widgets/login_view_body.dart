import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/core/widgets/password_field_widget.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/widgets/auth_texts_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_logo_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/toggle_screens_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthLogoWidget(),
                const AuthTextWidget(
                  title: AppStrings.login,
                  subtitleText: AppStrings.loginSubtitle,
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
                const ForgetPasswordButtonWidget(),
                CustomElevatedButtonWidget(
                  isLoading: state is LoginLoadingState,
                  verticalPadding: AppPadding.p8,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text);
                    }
                  },
                  child: const Text(
                    AppStrings.login,
                    style: StylesManager.semiBold18,
                  ),
                ),
                ToggleAuthScreensWidget(
                    onButtonPressed: () {
                      context.push(Routes.registerRoute);
                    },
                    descriptionText: AppStrings.doNotHaveAnAccount,
                    buttonText: AppStrings.signUp),
              ],
            ),
          ),
        );
      },
    );
  }
}
