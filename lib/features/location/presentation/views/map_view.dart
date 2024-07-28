import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is UpdateUserAddressSuccess) {
          if (context.read<LocationCubit>().isAuth) {
            context.push(Routes.homeRoute);
          } else {
            //TODO: Added pop navigation after finishing account feature
          }
        }
      },
      child: const Scaffold(body: MapViewBody()),
    );
  }
}
