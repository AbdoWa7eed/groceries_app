import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';

class LocationViewListener extends StatelessWidget {
  const LocationViewListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is SelectLocationErrorStates) {
          showSnackBar(context, text: state.error);
        }

        if (state is UpdateUserAddressSuccess) {
          if (context.read<LocationCubit>().isAuth) {
            context.push(Routes.homeRoute);
          } else {
            // TODO: Added pop navigation after finishing account feature
          }
        }

        if (state is GetPositionSuccess) {
          context.push(Routes.mapRoute);
        }
      },
      child: child,
    );
  }
}
