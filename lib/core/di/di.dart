import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:groceries_app/core/data/data_source/cart_data_source.dart';
import 'package:groceries_app/core/data/data_source/favorite_data_source.dart';
import 'package:groceries_app/core/data/data_source/products_data_source.dart';
import 'package:groceries_app/core/data/repo/cart_repo_impl.dart';
import 'package:groceries_app/core/data/repo/favorite_repo_impl.dart';
import 'package:groceries_app/core/data/repo/products_repo_impl.dart';
import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/domain/repo/favorite_repo.dart';
import 'package:groceries_app/core/domain/repo/products_repo.dart';
import 'package:groceries_app/core/domain/usecases/add_to_cart_usecase.dart';
import 'package:groceries_app/core/domain/usecases/get_products_usecase.dart';
import 'package:groceries_app/core/domain/usecases/remove_favorite_usecase.dart';
import 'package:groceries_app/core/network/cart/cart_api_service.dart';
import 'package:groceries_app/core/network/dio_factory.dart';
import 'package:groceries_app/core/network/favorites/favorite_api_service.dart';
import 'package:groceries_app/core/network/products/product_api_service.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/features/account/data/api/account_api_service.dart';
import 'package:groceries_app/features/account/data/data_source/account_data_source.dart';
import 'package:groceries_app/features/account/data/repo/account_repo_impl.dart';
import 'package:groceries_app/features/account/domain/repo/account_repo.dart';
import 'package:groceries_app/features/account/domain/usecase/get_profile_usecase.dart';
import 'package:groceries_app/features/account/domain/usecase/logout_usecase.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:groceries_app/features/auth/data/api/auth_api_service.dart';
import 'package:groceries_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:groceries_app/features/auth/data/repo/auth_repository_impl.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';
import 'package:groceries_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:groceries_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:groceries_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:groceries_app/features/cart/domain/usecases/update_item_quantity_usecase.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/change_password/data/api/change_password_api_service.dart';
import 'package:groceries_app/features/change_password/data/data_source/change_password_data_source.dart';
import 'package:groceries_app/features/change_password/data/repo/change_password_repo_impl.dart';
import 'package:groceries_app/features/change_password/domain/repo/change_password_repo.dart';
import 'package:groceries_app/features/change_password/domain/usecase/change_password_usecase.dart';
import 'package:groceries_app/features/checkout/data/api/checkout_api_service.dart';
import 'package:groceries_app/features/checkout/data/data_source/checkout_data_source.dart';
import 'package:groceries_app/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:groceries_app/features/checkout/domain/repo/checkout_repository.dart';
import 'package:groceries_app/features/checkout/domain/usecases/confirm_payment_usecase.dart';
import 'package:groceries_app/features/checkout/domain/usecases/place_order_usecase.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/confirm_payment_cubit.dart';
import 'package:groceries_app/features/explore/data/api/explore_api_service.dart';
import 'package:groceries_app/features/explore/data/data_source/explore_data_source.dart';
import 'package:groceries_app/features/explore/data/repo/explore_repo_impl.dart';
import 'package:groceries_app/features/explore/domain/repo/explore_repository.dart';
import 'package:groceries_app/features/explore/domain/usecases/get_categories_usecase.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:groceries_app/features/favorites/domain/usecases/add_all_to_cart_usecase.dart';
import 'package:groceries_app/features/favorites/domain/usecases/get_favorite_usecase.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:groceries_app/features/location/data/api/location_api_service.dart';
import 'package:groceries_app/features/location/data/api/update_address_api_service.dart';
import 'package:groceries_app/features/location/data/data_source/location_data_source.dart';
import 'package:groceries_app/features/location/data/repo/location_repo_impl.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';
import 'package:groceries_app/features/location/domain/usecases/get_place_details_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/get_suggested_places_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/place_from_coordinates_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/update_user_address_usecase.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/phone_auth/data/api/phone_auth_api_service.dart';
import 'package:groceries_app/features/phone_auth/data/data_source/phone_auth_data_source.dart';
import 'package:groceries_app/features/phone_auth/data/repo/phone_auth_repo_impl.dart';
import 'package:groceries_app/features/phone_auth/domain/repo/phone_auth_repo.dart';
import 'package:groceries_app/features/phone_auth/domain/usecase/send_otp_usecase.dart';
import 'package:groceries_app/features/phone_auth/domain/usecase/verify_phone_usecase.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/product_details/data/api/product_details_api_service.dart';
import 'package:groceries_app/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:groceries_app/features/product_details/data/repo/product_details_repo_impl.dart';
import 'package:groceries_app/features/product_details/domain/repo/product_details_repo.dart';
import 'package:groceries_app/features/product_details/domain/usecases/add_to_favorite_usecase.dart';
import 'package:groceries_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/profile/data/api/profile_api_service.dart';
import 'package:groceries_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:groceries_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:groceries_app/features/profile/domain/repo/profile_repository.dart';
import 'package:groceries_app/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:groceries_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:groceries_app/features/shop/data/api/shop_api_service.dart';
import 'package:groceries_app/features/shop/data/data_source/shop_data_source.dart';
import 'package:groceries_app/features/shop/data/repo/shop_repo_impl.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_banners_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_best_selling_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_exclusive_offers_usecase.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/change_password/presentation/cubit/change_password_cubit.dart';

part 'di.main.dart';
