import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/forget_password/presentation/cubit/forget_password_cubit.dart';

class ForgetPasswordFeatureButton extends StatelessWidget {
  const ForgetPasswordFeatureButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return CustomElevatedButtonWidget(
          isLoading: state is ForgetPasswordLoading,
          onPressed: onPressed,
          child: Text(
            text,
            style: StylesManager.semiBold18,
          ),
        );
      },
    );
  }
}
