import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';

class AccountViewListener extends StatelessWidget {
  const AccountViewListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listener: (context, state) {
        if (state is AccountLogoutError) {
          showSnackBar(context, text: state.error);
        }

        if (state is AccountLogoutSuccess) {
          _handleLogoutSuccess(context);
        }
      },
      child: child,
    );
  }

  _handleLogoutSuccess(BuildContext context) async {
    if (context.mounted) {
      await resetDis();
      if (context.mounted) {
        navigateToLogin(context);
      }
    }
  }

  void navigateToLogin(BuildContext context) {
    context.popAllThenPush(Routes.loginRoute);
  }
}
