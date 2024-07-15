import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries_app/core/network/dio_factory.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/features/auth/data/api/auth_api_service.dart';
import 'package:groceries_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:groceries_app/features/auth/data/repo/auth_repository_impl.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';
import 'package:groceries_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:groceries_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'di.main.dart';
