import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/widgets/location_confirmation_dialog.dart';

class LocationViewListener extends StatelessWidget {
  const LocationViewListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          final cubit = context.read<LocationCubit>();
          if (state is SelectLocationErrorStates) {
            showSnackBar(context, text: state.error);
          }

          if (state is GetCurrentLocationSuccess) {
            showConfirmationDialog(
                context: context, cubit: cubit, address: state.entity.address);
          }
          if (state is GetPositionSuccess) {
            context.push(Routes.mapRoute);
          }
        },
        child: child);
  }

  void showConfirmationDialog({
    required BuildContext context,
    required LocationCubit cubit,
    required String address,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => BlocProvider.value(
              value: cubit,
              child: LocationConfirmationDialog(address: address),
            ));
  }
}
