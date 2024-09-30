import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/theme_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:provider/provider.dart';

class NectarApp extends StatefulWidget {
  const NectarApp._internal();

  static const NectarApp _instance = NectarApp._internal();

  factory NectarApp() => _instance;

  @override
  State<NectarApp> createState() => _NectarAppState();
}

class _NectarAppState extends State<NectarApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (context) => getIt<HomeController>(),
        ),
        BlocProvider<ShopCubit>(
          create: (context) => getIt<ShopCubit>()..initShopData(),
        ),
        BlocProvider<ExploreCubit>(
          create: (context) => getIt<ExploreCubit>()..getCategories(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => getIt<CartCubit>(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => getIt<FavoriteCubit>(),
        ),
        BlocProvider<AccountCubit>(
          create: (context) => getIt<AccountCubit>()..getProfile(),
        ),
      ],
      child: MaterialApp.router(
        scrollBehavior: const ScrollBehavior(),
        debugShowCheckedModeBanner: false,
        routerConfig: RouteGenerator.router,
        theme: appTheme,
        title: AppStrings.title,
      ),
    );
  }
}
