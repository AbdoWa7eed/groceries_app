import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/views/login_view.dart';
import 'package:groceries_app/features/auth/presentation/views/register_view.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:groceries_app/features/explore/presentation/views/category_products_view.dart';
import 'package:groceries_app/features/home/presentation/views/home_view.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/views/map_view.dart';
import 'package:groceries_app/features/location/presentation/views/select_location_view.dart';
import 'package:groceries_app/features/onboarding/onboarding_view.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/phone_auth/presentation/views/phone_auth_view.dart';
import 'package:groceries_app/features/phone_auth/presentation/views/verify_phone_view.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:groceries_app/features/shop/presentation/views/see_all_view.dart';
import '../widgets/slide_transition.dart';

part 'routes_manager.main.dart';