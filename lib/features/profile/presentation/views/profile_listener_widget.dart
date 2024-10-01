import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileListenerWidget extends StatelessWidget {
  const ProfileListenerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileError) {
          showSnackBar(context, text: state.error);
        }
        if (state is UpdateProfileSuccess) {
          showSnackBar(
            context,
            text: AppStrings.profileUpdated,
            color: ColorManager.primary,
          );
        }
      },
      child: child,
    );
  }
}
