import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/views/login_view.dart';
import 'package:groceries_app/features/auth/presentation/views/register_view.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/views/map_view.dart';
import 'package:groceries_app/features/location/presentation/views/select_location_view.dart';
import 'package:groceries_app/features/onboarding/onboarding_view.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/phone_auth/presentation/views/phone_auth_view.dart';
import 'package:groceries_app/features/phone_auth/presentation/views/verify_phone_view.dart';

import '../widgets/slide_transition.dart';
part 'routes_manager.main.dart';