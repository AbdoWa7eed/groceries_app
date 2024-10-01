import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:groceries_app/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:groceries_app/features/profile/presentation/widgets/update_button_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    _usernameController = TextEditingController(text: cubit.user.username);
    _emailController = TextEditingController(text: cubit.user.email);
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p18),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ProfileImageWidget(),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Column(
                    children: [
                      CustomTextFormField(
                        controller: _usernameController,
                        validator: ValidationBuilder()
                            .minLength(UiConstants.usernameMinLength)
                            .build(),
                        labelText: AppStrings.username,
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      CustomTextFormField(
                        validator: ValidationBuilder().email().build(),
                        controller: _emailController,
                        labelText: AppStrings.email,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: UpdateButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ProfileCubit>().updateProfile(
                      username: _usernameController.text.trim(),
                      email: _emailController.text.trim(),
                    );
              }
            },
          ),
        ),
      ],
    );
  }
}
