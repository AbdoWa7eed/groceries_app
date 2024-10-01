import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/change_password/presentation/cubit/change_password_cubit.dart';

class ChangePasswordButtonWidget extends StatelessWidget {
  const ChangePasswordButtonWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        return CustomElevatedButtonWidget(
          isLoading: state is ChangePasswordLoading,
          onPressed: onPressed,
          child: const Text(AppStrings.changePassword,
              style: StylesManager.semiBold18),
        );
      },
    );
  }
}
