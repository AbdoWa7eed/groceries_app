import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: CustomElevatedButtonWidget(
              isLoading: state is UpdateProfileLoading,
              horizontalPadding: AppPadding.p20,
              onPressed: onPressed,
              child: const Text(
                AppStrings.update,
                style: StylesManager.semiBold18,
              )),
        );
      },
    );
  }
}
