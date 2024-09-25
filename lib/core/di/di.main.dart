part of 'di.dart';

final getIt = GetIt.instance;

initDi() async {
  final instance = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(instance));
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
  }
}

initPhoneAuthDi() async {
  if (!getIt.isRegistered<PhoneAuthCubit>()) {
    getIt
      ..registerLazySingleton<PhoneAuthApiService>(
          () => PhoneAuthApiService(DioFactory.getDio()))
      ..registerLazySingleton<PhoneAuthDataSource>(
          () => PhoneAuthDataSourceImpl(getIt()))
      ..registerLazySingleton<PhoneAuthRepository>(
          () => PhoneAuthRepositoryImpl(getIt()))
      ..registerLazySingleton<SendOTPUsecase>(() => SendOTPUsecase(getIt()))
      ..registerLazySingleton<VerifyPhoneUsecase>(
          () => VerifyPhoneUsecase(getIt()))
      ..registerLazySingleton<PhoneAuthCubit>(
          () => PhoneAuthCubit(getIt(), getIt()));
  }
}

initLocationDi(LocationPurpose purpose) async {
  if (!getIt.isRegistered<LocationCubit>()) {
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
          () => UpdateUserAddressUseCase(getIt()))
      ..registerFactory<LocationCubit>(
          () => LocationCubit(getIt(), getIt(), getIt(), getIt(), purpose));
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

initCheckoutDi() {
  if (!getIt.isRegistered<CheckoutCubit>()) {
    getIt
      ..registerLazySingleton<CheckoutApiService>(
          () => CheckoutApiService(DioFactory.getDio()))
      ..registerLazySingleton<CheckoutDataSource>(
          () => CheckoutDataSourceImpl(getIt()))
      ..registerLazySingleton<CheckoutRepository>(
          () => CheckoutRepositoryImpl(getIt()))
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
