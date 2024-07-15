import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/widgets/auth_texts_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_loading_button.dart';
import 'package:groceries_app/features/auth/presentation/widgets/custom_logo_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:groceries_app/features/auth/presentation/widgets/password_suffix_icon.dart';
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
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _obscureText = true;
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
                CustomTextFormField(
                  controller: _passwordController,
                  validator: ValidationBuilder().maxLength(32).build(),
                  obscureText: _obscureText,
                  labelText: AppStrings.password,
                  suffix: PasswordSuffixIcon(
                    onTap: (value) {
                      setState(() {
                        _obscureText = value;
                      });
                    },
                  ),
                ),
                const ForgetPasswordButtonWidget(),
                CustomLoadingButton(
                    condition: state is LoginLoadingState,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      }
                    },
                    text: AppStrings.login),
                ToggleAuthScreensWidget(
                    onButtonPressed: () {
                      // TODO : GO TO SIGN UP
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
