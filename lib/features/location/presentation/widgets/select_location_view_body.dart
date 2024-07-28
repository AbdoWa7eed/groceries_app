import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/widgets/select_other_location_widget.dart';

class SelectLocationViewBody extends StatelessWidget {
  const SelectLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p20, horizontal: AppPadding.p20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(child: SvgPicture.asset(AssetsManager.location)),
            const Text(
              AppStrings.selectLocation,
              style: StylesManager.semiBold26,
            ),
            const SizedBox(height: AppSize.s12),
            const Text(
              AppStrings.selectLocationSubtitle,
              textAlign: TextAlign.center,
              style: StylesManager.medium16,
            ),
            CustomElevatedButtonWidget(
                isLoading: state is GetCurrentLocationLoading,
                verticalPadding: AppPadding.p20,
                child: const Text(AppStrings.selectCurrentLocation,
                    style: StylesManager.regular18),
                onPressed: () {
                  cubit.selectCurrentLocation();
                }),
            const SelectOtherLocationWidget(),
          ]),
        );
      },
    );
  }
}
