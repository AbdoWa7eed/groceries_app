import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:groceries_app/features/account/presentation/widgets/account_actions_list_view.dart';
import 'package:groceries_app/features/account/presentation/widgets/account_header_widget.dart';
import 'package:groceries_app/features/account/presentation/widgets/logout_button_widget.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          displacement: 1,
          onRefresh: () async => context.read<AccountCubit>().getProfile(),
          child: const SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                AccountViewHeaderWidget(),
                Divider(
                  color: ColorManager.lightGray,
                ),
                ActionsListViewWidget(),
              ],
            ),
          ),
        ),
        const LogoutButtonWidget(),
      ],
    );
  }
}
