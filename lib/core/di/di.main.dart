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
