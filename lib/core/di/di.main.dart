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

initLocationDi() async {
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
      ..registerLazySingleton<LocationCubit>(
          () => LocationCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

initHomeDi() async {
  if (!getIt.isRegistered<HomeController>()) {
    getIt.registerLazySingleton<HomeController>(() => HomeController());
  }

  if (!getIt.isRegistered<ProductApiService>()) {
    getIt.registerLazySingleton<ProductApiService>(
        () => ProductApiService(DioFactory.getDio()));
  }
  initShopScreenDi();
}

initShopScreenDi() async {
  if (!getIt.isRegistered<ShopCubit>()) {
    getIt
      ..registerLazySingleton<ShopApiService>(
          () => ShopApiService(DioFactory.getDio()))
      ..registerLazySingleton<ShopDataSource>(
          () => ShopDataSourceImpl(getIt(), getIt()))
      ..registerLazySingleton<ShopRepository>(() => ShopRepositoryImpl(getIt()))
      ..registerLazySingleton<GetBannersUseCase>(
          () => GetBannersUseCase(getIt()))
      ..registerLazySingleton<GetBestSellingUseCase>(
          () => GetBestSellingUseCase(getIt()))
      ..registerLazySingleton<GetExclusiveOffersUseCase>(
          () => GetExclusiveOffersUseCase(getIt()))
      ..registerLazySingleton<GetGroceriesUseCase>(
          () => GetGroceriesUseCase(getIt()))
      ..registerLazySingleton<ShopCubit>(
          () => ShopCubit(getIt(), getIt(), getIt(), getIt()));
  }
}

initProductDetailsDi() async {
  initFavoriteDi();
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
  if (!getIt.isRegistered<FavoriteRepository>()) {
    getIt
      ..registerLazySingleton<FavoriteApiService>(
          () => FavoriteApiService(DioFactory.getDio()))
      ..registerLazySingleton<FavoriteDataSource>(
          () => FavoriteDataSourceImpl(getIt()))
      ..registerLazySingleton<FavoriteRepository>(
          () => FavoriteRepositoryImpl(getIt()))
      ..registerLazySingleton<RemoveFromFavoriteUseCase>(
          () => RemoveFromFavoriteUseCase(getIt()));
  }
}

initExploreDi() {
  if (!getIt.isRegistered<ExploreCubit>()) {
    getIt
      ..registerLazySingleton<ExploreApiService>(
          () => ExploreApiService(DioFactory.getDio()))
      ..registerLazySingleton<ExploreDataSource>(
          () => ExploreDataSourceImpl(getIt(), getIt()))
      ..registerLazySingleton<ExploreRepository>(
          () => ExploreRepositoryImpl(getIt()))
      ..registerLazySingleton<GetCategoriesUseCase>(
          () => GetCategoriesUseCase(getIt()))
      ..registerLazySingleton<GetCategoryProductsUseCase>(
          () => GetCategoryProductsUseCase(getIt()))
      ..registerLazySingleton<ExploreCubit>(
          () => ExploreCubit(getIt(), getIt()));
  }
}
