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
  static const String seeAllRoute = '/seeAll';
  static const String searchResult = '/searchResult';
  static const String confirmPayment = '/confirmPayment';
  static const String changePassword = '/changePassword';
  static const String forgetPassword = '/forgetPassword';
  static const String verifyEmail = '/verifyEmail';
  static const String resetPassword = '/resetPassword';
}

abstract class RouteGenerator {
  static final GoRouter router = GoRouter(
      initialLocation: Routes.initialRoute,
      redirect: _redirect,
      routes: _getRoutes());

  static String? _redirect(BuildContext context, GoRouterState state) {
    if (state.fullPath == Routes.initialRoute) {
      final appPreferences = getIt<AppPreferences>();
      final onboardingViewed = appPreferences.isOnboardingViewed();
      if (!onboardingViewed) {
        return Routes.onBoardingRoute;
      }
      final loggedIn = appPreferences.getUserAccessToken() != null;
      if (!loggedIn) {
        return Routes.loginRoute;
      } else {
        return Routes.homeRoute;
      }
    }
    return null;
  }

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
        pageBuilder: (context, state) {
          initPhoneAuthDi();
          final purpose = state.extra as PhoneAuthPurpose;
          return CustomSlideTransition(
            child: BlocProvider<PhoneAuthCubit>(
              create: (context) => getIt()..setPurpose(purpose),
              child: const PhoneAuthView(),
            ),
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
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.locationRoute,
        pageBuilder: (context, state) {
          final purpose = state.extra as LocationPurpose;
          initLocationDi();
          return CustomSlideTransition(
            child: BlocProvider<LocationCubit>(
                create: (context) =>
                    getIt<LocationCubit>()..setPurpose(purpose),
                child: const SelectLocationView()),
          );
        },
      ),
      GoRoute(
        path: Routes.mapRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: BlocProvider<LocationCubit>.value(
              value: getIt(),
              child: const MapView(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.homeRoute,
        builder: (context, state) {
          initHomeDi();
          return MultiBlocProvider(providers: [
            ChangeNotifierProvider<HomeController>(
              create: (context) => getIt(),
            ),
            BlocProvider<ShopCubit>(
              create: (context) => getIt()..initShopData(),
            ),
            BlocProvider<ExploreCubit>(
              create: (context) => getIt()..getCategories(),
            ),
            BlocProvider<CartCubit>(
              create: (context) => getIt(),
            ),
            BlocProvider<FavoriteCubit>(
              create: (context) => getIt(),
            ),
            BlocProvider<AccountCubit>(
              create: (context) => getIt()..getProfile(),
            ),
          ], child: const HomeView());
        },
      ),
      GoRoute(
        path: Routes.seeAllRoute,
        pageBuilder: (context, state) {
          String title = state.extra as String;
          return CustomSlideTransition(
            child: BlocProvider<ShopCubit>.value(
              value: getIt(),
              child: SeeAllProductsView(title: title),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.productDetails,
        pageBuilder: (context, state) {
          initProductDetailsDi();
          int productId = state.extra as int;
          return CustomSlideTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<CartCubit>.value(
                  value: getIt<CartCubit>(),
                ),
                BlocProvider<ProductDetailsCubit>(
                  create: (context) => getIt<ProductDetailsCubit>()
                    ..getProductDetails(productId),
                ),
              ],
              child: const ProductDetailsView(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.categoryProducts,
        pageBuilder: (context, state) {
          final category = state.extra as CategoryEntity;
          return CustomSlideTransition(
            child: BlocProvider<ExploreCubit>.value(
              value: getIt()
                ..getCategoryProducts(categoryId: category.categoryId),
              child: CategoryProductsView(entity: category),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.searchResult,
        pageBuilder: (context, state) {
          initSearchDi();
          final query = state.extra as String;
          return CustomSlideTransition(
            child: BlocProvider<SearchCubit>(
                create: (context) =>
                    getIt<SearchCubit>()..getInitialProducts(query),
                child: const SearchResultView()),
          );
        },
      ),
      GoRoute(
        path: Routes.confirmPayment,
        pageBuilder: (context, state) {
          initConfirmPaymentDi();
          final entity = state.extra as PlaceOrderEntity;
          return CustomSlideTransition(
            child: BlocProvider<ConfirmPaymentCubit>(
                create: (context) =>
                    getIt<ConfirmPaymentCubit>()..setEntity(entity),
                child: const ConfirmPaymentView()),
          );
        },
      ),
      GoRoute(
        path: Routes.profileRoute,
        pageBuilder: (context, state) {
          initProfileDi();
          final user = state.extra as UserEntity;
          return CustomSlideTransition(
            child: BlocProvider<ProfileCubit>(
              create: (context) => getIt()..setUser(user),
              child: const ProfileView(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.changePassword,
        pageBuilder: (context, state) {
          initChangePasswordDi();
          return CustomSlideTransition(
            child: BlocProvider<ChangePasswordCubit>(
              create: (context) => getIt(),
              child: const ChangePasswordView(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.forgetPassword,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: const ForgetPasswordView(),
          );
        },
      ),
      GoRoute(
        path: Routes.verifyEmail,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: const VerifyEmailView(),
          );
        },
      ),
      GoRoute(
        path: Routes.resetPassword,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: const ResetPasswordView(),
          );
        },
      ),
    ];
  }
}
