part of 'routes_manager.dart';

abstract class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String locationRoute = "/location";
  static const String mapRoute = "/map";
  static const String homeRoute = "/home";
  static const String productDetails = "/productDetails";
  static const String categoryProducts = "/categoryProducts";
  static const String profileRoute = "/profile";
  static const String phoneAuthRoute = "/phoneAuth";
  static const String verifyPhoneRoute = "/verifyPhone";
}

abstract class RouteGenerator {
  static final GoRouter router = GoRouter(
      initialLocation: Routes.initialRoute,
      redirect: (context, state) {
        if (state.fullPath == Routes.initialRoute) {
          final appPreferences = getIt<AppPreferences>();
          final loggedIn = appPreferences.getUserAccessToken() != null;
          final onboardingViewed = appPreferences.isOnboardingViewed();
          if (!loggedIn && !onboardingViewed) {
            return Routes.onBoardingRoute;
          } else if (!loggedIn) {
            return Routes.loginRoute;
          } else {
            return Routes.homeRoute;
          }
        }
        return null;
      },
      routes: _getRoutes());

  static List<GoRoute> _getRoutes() {
    return [
      GoRoute(
        path: Routes.initialRoute,
        builder: (context, state) {
          return const SizedBox();
        },
      ),
      GoRoute(
        path: Routes.onBoardingRoute,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: Routes.loginRoute,
        builder: (context, state) {
          initAuthDi();
          return BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: Routes.registerRoute,
        builder: (context, state) {
          return BlocProvider<AuthCubit>.value(
            value: getIt<AuthCubit>(),
            child: const RegisterView(),
          );
        },
      ),
      GoRoute(
        path: Routes.phoneAuthRoute,
        builder: (context, state) {
          initPhoneAuthDi();
          return BlocProvider<PhoneAuthCubit>(
            create: (context) => getIt<PhoneAuthCubit>(),
            child: const PhoneAuthView(),
          );
        },
      ),
      GoRoute(
        path: Routes.verifyPhoneRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
              child: BlocProvider<PhoneAuthCubit>.value(
            value: getIt<PhoneAuthCubit>(),
            child: const VerifyPhoneView(),
          ));
        },
      ),
      GoRoute(
        path: Routes.locationRoute,
        builder: (context, state) {
          initLocationDi();
          return BlocProvider<LocationCubit>(
              create: (context) => getIt<LocationCubit>(),
              child: const SelectLocationView());
        },
      ),
      GoRoute(
        path: Routes.mapRoute,
        builder: (context, state) {
          return BlocProvider<LocationCubit>.value(
            value: getIt<LocationCubit>(),
            child: const MapView(),
          );
        },
      ),
    ];
  }
}
