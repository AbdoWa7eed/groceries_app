import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:groceries_app/features/account/presentation/views/account_view_listener.dart';
import 'package:groceries_app/features/account/presentation/widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountViewListener(
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              if (state is AccountLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is AccountError) {
                return CustomErrorWidget(
                  error: state.error,
                  onTryAgain: () => context.read<AccountCubit>().getProfile(),
                );
              }
              return const AccountViewBody();
            },
          ),
        ),
      ),
    );
  }
}
