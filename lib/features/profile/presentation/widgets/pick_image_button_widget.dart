import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:groceries_app/features/profile/presentation/widgets/pick_image_bottom_sheet_widget.dart';

class PickImageButtonWidget extends StatelessWidget {
  const PickImageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ProfileCubit>();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return PickImageBottomSheetWidget(
              onCameraTapped: cubit.pickImageFromCamera,
              onGalleryTapped: cubit.pickImageFromGallery,
            );
          },
        );
      },
      child: const CircleAvatar(
        radius: AppSize.s16,
        backgroundColor: ColorManager.primary,
        child: Icon(
          Icons.edit_outlined,
          color: ColorManager.white,
          size: AppSize.s20,
        ),
      ),
    );
  }
}
