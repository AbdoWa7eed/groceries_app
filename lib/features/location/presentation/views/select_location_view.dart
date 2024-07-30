import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/core/widgets/skip_text_button.dart';
import 'package:groceries_app/features/location/presentation/widgets/select_location_view_body.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
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
    }, builder: (context, state) {
      final cubit = context.read<LocationCubit>();
      return Scaffold(
        appBar: AppBar(
          actions: cubit.isAuth ? [SkipTextButton(onPressed: () {})] : [],
          title: const Text(
            AppStrings.location,
            style: StylesManager.bold24,
          ),
          leading: context.canPop() ? const CustomBackButton() : null,
        ),
        body: const SelectLocationViewBody(),
      );
    });
  }
}
