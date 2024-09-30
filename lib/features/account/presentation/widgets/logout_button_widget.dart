import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        final cubit = context.read<AccountCubit>();
        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: CustomElevatedButtonWidget(
            isLoading: state is AccountLogoutLoading,
            verticalPadding: AppPadding.p20,
            horizontalPadding: AppPadding.p20,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.lightGray2,
            ),
            onPressed: () => cubit.logout(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.logout_rounded,
                  color: ColorManager.primary,
                ),
                const Spacer(),
                Text(AppStrings.logout,
                    style: StylesManager.semiBold18
                        .copyWith(color: ColorManager.primary)),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
