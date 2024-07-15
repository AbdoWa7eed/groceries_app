part of 'di.dart';

final getIt = GetIt.instance;

initDi() async {
  final instance = await SharedPreferences.getInstance();
  final dio = DioFactory.getDio();

  getIt
    ..registerLazySingleton<AppPreferences>(() => AppPreferences(instance))
    ..registerLazySingleton<Dio>(() => dio);
}

initAuthDi() async {
  if (!getIt.isRegistered<AuthCubit>()) {
    getIt
    ..registerLazySingleton<AuthApiService>(() => AuthApiService(getIt()))
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(getIt()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()))
    ..registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()))
    ..registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()))
    ..registerLazySingleton<AuthCubit>(() => AuthCubit(getIt(), getIt() , getIt()));
  }
  
}
