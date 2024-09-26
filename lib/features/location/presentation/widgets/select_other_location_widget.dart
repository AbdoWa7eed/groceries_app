import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';

class SelectOtherLocationWidget extends StatelessWidget {
  const SelectOtherLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        if (state is GetPositionLoading) {
          return const CircularProgressIndicator();
        }
        return TextButton(
          onPressed: () {
            cubit.getPosition();
          },
          child: Text(AppStrings.selectOtherLocation,
              style: StylesManager.medium16.copyWith(
                  color: ColorManager.primary,
                  decorationColor: ColorManager.primary,
                  decoration: TextDecoration.underline)),
        );
      },
    );
  }
}
