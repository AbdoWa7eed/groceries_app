part of 'di.dart';

final getIt = GetIt.instance;

initDi() async {
  final instance = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(instance));
  getIt.registerLazySingleton<RefreshTokenApiService>(
      () => RefreshTokenApiService(DioFactory.getNewDioInstance()));
}

initAuthDi() async {
  if (!getIt.isRegistered<AuthCubit>()) {
    getIt
      ..registerLazySingleton<AuthApiService>(
          () => AuthApiService(DioFactory.getDio()))
      ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(getIt()))
      ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()))
      ..registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()))
      ..registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()))
      ..registerLazySingleton<AuthCubit>(
          () => AuthCubit(getIt(), getIt(), getIt()));
  } else {
    getIt.unregister<AuthCubit>();
    getIt.registerLazySingleton<AuthCubit>(
        () => AuthCubit(getIt(), getIt(), getIt()));
  }
}

initPhoneAuthDi() async {
  if (!getIt.isRegistered<VerifyPhoneUsecase>()) {
    getIt
      ..registerLazySingleton<PhoneAuthApiService>(
          () => PhoneAuthApiService(DioFactory.getDio()))
      ..registerLazySingleton<PhoneAuthDataSource>(
          () => PhoneAuthDataSourceImpl(getIt()))
      ..registerLazySingleton<PhoneAuthRepository>(
          () => PhoneAuthRepositoryImpl(getIt()))
      ..registerLazySingleton<SendOTPUsecase>(() => SendOTPUsecase(getIt()))
      ..registerLazySingleton<VerifyPhoneUsecase>(
          () => VerifyPhoneUsecase(getIt()));
  }
  if (!getIt.isRegistered<PhoneAuthCubit>()) {
    getIt.registerLazySingleton<PhoneAuthCubit>(
        () => PhoneAuthCubit(getIt(), getIt()));
  }
}

initLocationDi() async {
  if (!getIt.isRegistered<UpdateUserAddressUseCase>()) {
    getIt
      ..registerLazySingleton<LocationApiService>(
          () => LocationApiService(DioFactory.getDio()))
      ..registerLazySingleton<UpdateAddressApiService>(
          () => UpdateAddressApiService(DioFactory.getDio()))
      ..registerLazySingleton<LocationDataSource>(
          () => LocationDataSourceImpl(getIt(), getIt()))
      ..registerLazySingleton<LocationRepository>(
          () => LocationRepositoryImpl(getIt()))
      ..registerLazySingleton<GetPlaceFromCoordinatesUseCase>(
          () => GetPlaceFromCoordinatesUseCase(getIt()))
      ..registerLazySingleton<GetSuggestedPlacesUseCase>(
          () => GetSuggestedPlacesUseCase(getIt()))
      ..registerLazySingleton<GetPlaceDetailsUseCase>(
          () => GetPlaceDetailsUseCase(getIt()))
      ..registerLazySingleton<UpdateUserAddressUseCase>(
          () => UpdateUserAddressUseCase(getIt()));
  }

  if (!getIt.isRegistered<LocationCubit>()) {
    getIt.registerLazySingleton<LocationCubit>(
        () => LocationCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

initHomeDi() async {
  if (!getIt.isRegistered<HomeController>()) {
    getIt.registerLazySingleton<HomeController>(() => HomeController());
  }

  initProductsResources();
  initShopScreenDi();
  initCartDi();
  initFavoriteDi();
}

initProductsResources() {
  if (!getIt.isRegistered<GetProductsUseCase>()) {
    getIt
      ..registerLazySingleton<ProductsApiService>(
          () => ProductsApiService(DioFactory.getDio()))
      ..registerLazySingleton<ProductsDataSource>(
          () => ProductsDataSourceImpl(getIt()))
      ..registerLazySingleton<ProductsRepository>(
          () => ProductsRepositoryImpl(getIt()))
      ..registerLazySingleton<GetProductsUseCase>(
          () => GetProductsUseCase(getIt()));
  }
}

initShopScreenDi() async {
  if (!getIt.isRegistered<ShopCubit>()) {
    getIt
      ..registerLazySingleton<ShopApiService>(
          () => ShopApiService(DioFactory.getDio()))
      ..registerLazySingleton<ShopDataSource>(() => ShopDataSourceImpl(getIt()))
      ..registerLazySingleton<ShopRepository>(() => ShopRepositoryImpl(getIt()))
      ..registerLazySingleton<GetBannersUseCase>(
          () => GetBannersUseCase(getIt()))
      ..registerLazySingleton<GetBestSellingUseCase>(
          () => GetBestSellingUseCase(getIt()))
      ..registerLazySingleton<GetExclusiveOffersUseCase>(
          () => GetExclusiveOffersUseCase(getIt()))
      ..registerLazySingleton<ShopCubit>(
          () => ShopCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

initProductDetailsDi() async {
  if (!getIt.isRegistered<ProductDetailsCubit>()) {
    getIt
      ..registerLazySingleton<ProductDetailsApiService>(
          () => ProductDetailsApiService(DioFactory.getDio()))
      ..registerLazySingleton<ProductDetailsDataSource>(
          () => ProductDetailsDataSourceImpl(getIt()))
      ..registerLazySingleton<ProductDetailsRepository>(
          () => ProductDetailsRepoImpl(getIt()))
      ..registerLazySingleton<GetProductDetailsUseCase>(
          () => GetProductDetailsUseCase(getIt()))
      ..registerLazySingleton<AddProductToFavoritesUseCase>(
          () => AddProductToFavoritesUseCase(getIt()))
      ..registerFactory<ProductDetailsCubit>(
          () => ProductDetailsCubit(getIt(), getIt(), getIt()));
  }
}

initFavoriteDi() {
  if (!getIt.isRegistered<FavoriteCubit>()) {
    getIt
      ..registerLazySingleton<FavoriteApiService>(
          () => FavoriteApiService(DioFactory.getDio()))
      ..registerLazySingleton<FavoriteDataSource>(
          () => FavoriteDataSourceImpl(getIt()))
      ..registerLazySingleton<FavoriteRepository>(
          () => FavoriteRepositoryImpl(getIt()))
      ..registerLazySingleton<GetFavoriteUseCase>(
          () => GetFavoriteUseCase(getIt()))
      ..registerLazySingleton<AddAllToCartUseCase>(
          () => AddAllToCartUseCase(getIt()))
      ..registerLazySingleton<RemoveFromFavoriteUseCase>(
          () => RemoveFromFavoriteUseCase(getIt()))
      ..registerLazySingleton<FavoriteCubit>(
          () => FavoriteCubit(getIt(), getIt(), getIt()));
  }
}

initExploreDi() {
  if (!getIt.isRegistered<ExploreCubit>()) {
    getIt
      ..registerLazySingleton<ExploreApiService>(
          () => ExploreApiService(DioFactory.getDio()))
      ..registerLazySingleton<ExploreDataSource>(
          () => ExploreDataSourceImpl(getIt()))
      ..registerLazySingleton<ExploreRepository>(
          () => ExploreRepositoryImpl(getIt()))
      ..registerLazySingleton<GetCategoriesUseCase>(
          () => GetCategoriesUseCase(getIt()))
      ..registerLazySingleton<ExploreCubit>(
          () => ExploreCubit(getIt(), getIt()));
  }
}

initSearchDi() async {
  if (!getIt.isRegistered<SearchCubit>()) {
    getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  }
}

initCartDi() async {
  if (!getIt.isRegistered<CartCubit>()) {
    getIt
      ..registerLazySingleton<CartApiService>(
          () => CartApiService(DioFactory.getDio()))
      ..registerLazySingleton<CartDataSource>(() => CartDataSourceImpl(getIt()))
      ..registerLazySingleton<CartRepository>(() => CartRepositoryImpl(getIt()))
      ..registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(getIt()))
      ..registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(getIt()))
      ..registerLazySingleton<UpdateItemQuantityUseCase>(
          () => UpdateItemQuantityUseCase(getIt()))
      ..registerLazySingleton<RemoveFromCartUseCase>(
          () => RemoveFromCartUseCase(getIt()))
      ..registerLazySingleton<CartCubit>(
          () => CartCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

initCheckoutResouces() {
  if (!getIt.isRegistered<CheckoutRepository>()) {
    getIt
      ..registerLazySingleton<CheckoutApiService>(
          () => CheckoutApiService(DioFactory.getDio()))
      ..registerLazySingleton<CheckoutDataSource>(
          () => CheckoutDataSourceImpl(getIt()))
      ..registerLazySingleton<CheckoutRepository>(
          () => CheckoutRepositoryImpl(getIt()));
  }
}

initCheckoutDi() {
  initCheckoutResouces();
  if (!getIt.isRegistered<CheckoutCubit>()) {
    getIt
      ..registerLazySingleton<PlaceOrderUseCase>(
          () => PlaceOrderUseCase(getIt()))
      ..registerLazySingleton<CheckoutCubit>(() => CheckoutCubit(getIt()));
  } else {
    getIt.unregister<CheckoutCubit>(
        disposingFunction: (cubit) => cubit.isClosed ? null : cubit.close());
    getIt.registerLazySingleton<CheckoutCubit>(() => CheckoutCubit(getIt()));
  }
}

initConfirmPaymentDi() {
  initCheckoutResouces();
  if (!getIt.isRegistered<ConfirmPaymentCubit>()) {
    getIt
      ..registerLazySingleton<ConfirmPaymentUseCase>(
          () => ConfirmPaymentUseCase(getIt()))
      ..registerFactory<ConfirmPaymentCubit>(
          () => ConfirmPaymentCubit(getIt()));
  } else {
    getIt.unregister<ConfirmPaymentCubit>(
        disposingFunction: (cubit) => cubit.isClosed ? null : cubit.close());
    getIt.registerLazySingleton<ConfirmPaymentCubit>(
        () => ConfirmPaymentCubit(getIt()));
  }
}

initAccountDi() {
  if (!getIt.isRegistered<AccountCubit>()) {
    getIt
      ..registerLazySingleton<AccountApiService>(
          () => AccountApiService(DioFactory.getDio()))
      ..registerLazySingleton<AccountDataSource>(
          () => AccountDataSourceImpl(getIt()))
      ..registerLazySingleton<AccountRepository>(
          () => AccountRepositoryImpl(getIt()))
      ..registerLazySingleton<GetProfileUseCase>(
          () => GetProfileUseCase(getIt()))
      ..registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt()))
      ..registerLazySingleton<AccountCubit>(
          () => AccountCubit(getIt(), getIt()));
  }
}

initProfileDi() {
  if (!getIt.isRegistered<ProfileCubit>()) {
    getIt
      ..registerLazySingleton<ProfileApiService>(
          () => ProfileApiService(DioFactory.getDio()))
      ..registerLazySingleton<ProfileDataSource>(
          () => ProfileDataSourceImpl(getIt()))
      ..registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(getIt()))
      ..registerLazySingleton<UpdateProfileUseCase>(
          () => UpdateProfileUseCase(getIt()))
      ..registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  }
}

initChangePasswordDi() {
  if (!getIt.isRegistered<ChangePasswordCubit>()) {
    getIt
      ..registerLazySingleton<ChangePasswordApiService>(
          () => ChangePasswordApiService(DioFactory.getDio()))
      ..registerLazySingleton<ChangePasswordDataSource>(
          () => ChangePasswordDataSourceImpl(getIt()))
      ..registerLazySingleton<ChangePasswordRepository>(
          () => ChangePasswordRepositoryImpl(getIt()))
      ..registerLazySingleton<ChangePasswordUseCase>(
          () => ChangePasswordUseCase(getIt()))
      ..registerFactory<ChangePasswordCubit>(
          () => ChangePasswordCubit(getIt()));
  }
}

void initForgetPasswordDi() {
  if (!getIt.isRegistered<ForgetPasswordCubit>()) {
    getIt
      ..registerLazySingleton<ForgetPasswordApiService>(
          () => ForgetPasswordApiService(DioFactory.getDio()))
      ..registerLazySingleton<ForgetPasswordDataSource>(
          () => ForgetPasswordDataSourceImpl(getIt()))
      ..registerLazySingleton<ForgetPasswordRepository>(
          () => ForgetPasswordRepositoryImpl(getIt()))
      ..registerLazySingleton<SendEmailVerificationCodeUseCase>(
          () => SendEmailVerificationCodeUseCase(getIt()))
      ..registerLazySingleton<VerifyEmailUseCase>(
          () => VerifyEmailUseCase(getIt()))
      ..registerLazySingleton<ResetPasswordUseCase>(
          () => ResetPasswordUseCase(getIt()))
      ..registerLazySingleton<ForgetPasswordCubit>(
          () => ForgetPasswordCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

void unregisterForgetPasswordDi() {
  if (getIt.isRegistered<ForgetPasswordCubit>()) {
    getIt
      ..unregister<ForgetPasswordCubit>()
      ..unregister<ResetPasswordUseCase>()
      ..unregister<VerifyEmailUseCase>()
      ..unregister<SendEmailVerificationCodeUseCase>()
      ..unregister<ForgetPasswordRepository>()
      ..unregister<ForgetPasswordDataSource>()
      ..unregister<ForgetPasswordApiService>();
  }
}

void initOrdersDi() {
  if (!getIt.isRegistered<CancelOrderUseCase>()) {
    getIt
      ..registerLazySingleton<OrdersApiService>(
          () => OrdersApiService(DioFactory.getDio()))
      ..registerLazySingleton<OrdersDataSource>(
          () => OrdersDataSourceImpl(getIt()))
      ..registerLazySingleton<OrdersRepository>(
          () => OrdersRepositoryImpl(getIt()))
      ..registerLazySingleton<GetOrdersUseCase>(() => GetOrdersUseCase(getIt()))
      ..registerLazySingleton<CancelOrderUseCase>(
          () => CancelOrderUseCase(getIt()))
      ..registerFactory<OrdersCubit>(() => OrdersCubit(getIt(), getIt()));
  }
}

void initReviewsDi() {
  if (!getIt.isRegistered<GetReviewsUseCase>()) {
    getIt
      ..registerLazySingleton<ReviewsApiService>(
          () => ReviewsApiService(DioFactory.getDio()))
      ..registerLazySingleton<ReviewsDataSource>(
          () => ReviewsDataSourceImpl(getIt()))
      ..registerLazySingleton<ReviewsRepository>(
          () => ReviewsRepositoryImpl(getIt()))
      ..registerLazySingleton<GetReviewsUseCase>(
          () => GetReviewsUseCase(getIt()));
  }

  if (!getIt.isRegistered<ReviewsCubit>()) {
    getIt.registerLazySingleton<ReviewsCubit>(() => ReviewsCubit(getIt()));
  }
}

void initAddReviewDi() {
  initReviewsDi();
  if (!getIt.isRegistered<AddReviewUseCase>()) {
    getIt.registerLazySingleton<AddReviewUseCase>(
        () => AddReviewUseCase(getIt()));
  }

  if (!getIt.isRegistered<AddReviewCubit>()) {
    getIt.registerFactory<AddReviewCubit>(() => AddReviewCubit(getIt()));
  }
}

void initManageReviewDi() {
  initReviewsDi();
  if (!getIt.isRegistered<UpdateReviewUseCase>()) {
    getIt
      ..registerLazySingleton<DeleteReviewUseCase>(
          () => DeleteReviewUseCase(getIt()))
      ..registerLazySingleton<UpdateReviewUseCase>(
          () => UpdateReviewUseCase(getIt()));
  }

  if (!getIt.isRegistered<ManageReviewCubit>()) {
    getIt.registerFactory(() => ManageReviewCubit(getIt(), getIt()));
  }
}

Future<void> resetDis() async {
  await getIt<AppPreferences>().logout();
  await getIt.reset();
  await initDi();
}
