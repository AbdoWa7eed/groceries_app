import 'package:flutter/material.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/home/presentation/views/home_view.dart';

void showLogoutDialog() async {
  showDialog(
    context: HomeView.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const LogoutDialogWidget();
    },
  );
}

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.sessionExpired),
      content: const Text(AppStrings.loginAgain),
      actions: <Widget>[
        Center(
          child: TextButton(
            child: const Text(AppStrings.logout),
            onPressed: () {
              _handleLogoutSuccess(context);
            },
          ),
        ),
      ],
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
