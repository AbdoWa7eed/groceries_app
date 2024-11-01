import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/onboarding/widgets/onboarding_text_widget.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        const Image(
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            image: AssetImage(AssetsManager.onBoardingImage)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetsManager.carrotLogo,
                colorFilter:
                    const ColorFilter.mode(ColorManager.white, BlendMode.srcIn),
              ),
              const OnboardingTextWidget(),
              CustomElevatedButtonWidget(
                  onPressed: () {
                    getIt<AppPreferences>().setUserViewedOnboarding();
                    context.replace(Routes.loginRoute);
                  },
                  child: const Text(AppStrings.getStarted,
                      style: StylesManager.semiBold18)),
            ],
          ),
        )
      ],
    );
  }
}
