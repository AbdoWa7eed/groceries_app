import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/skip_text_button.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/custom_header_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/input_phone_filed.dart';

class PhoneAuthViewBody extends StatelessWidget {
  const PhoneAuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        final cubit = context.read<PhoneAuthCubit>();
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomHeaderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p26, vertical: AppPadding.p28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(AppStrings.enterPhoneNumber,
                        style: StylesManager.bold24),
                    const InputPhoneField(),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    Visibility(
                      visible: cubit.isAuth,
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: SkipTextButton(
                          onPressed: () {
                            context.popAllThenPush(
                              Routes.locationRoute,
                              extra: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
