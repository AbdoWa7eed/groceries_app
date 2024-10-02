import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';

class LocationConfirmationDialog extends StatelessWidget {
  const LocationConfirmationDialog({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return Dialog(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(AppStrings.confirmThisLocation),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Builder(
                  builder: (context) {
                    if (state is UpdateUserAddressLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButtonWidget(
                              height: AppSize.s45,
                              verticalPadding: 0,
                              onPressed: () {
                                // cubit.confirmationDialogShown = false;
                                context.pop();
                              },
                              child: const Text(AppStrings.cancel,
                                  style: StylesManager.regular18)),
                        ),
                        const SizedBox(width: AppSize.s12),
                        Expanded(
                          child: CustomElevatedButtonWidget(
                              verticalPadding: 0,
                              height: AppSize.s45,
                              onPressed: () {
                                if (cubit.purpose != LocationPurpose.delivery) {
                                  cubit.updateUserAddress(address);
                                } else {
                                  navigateToCheckout(context);
                                }
                              },
                              child: const Text(AppStrings.confirm,
                                  style: StylesManager.regular18)),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void navigateToCheckout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.popAllButOne();
      getIt<CheckoutCubit>().deliveryAddress = address;
    });
  }
}
