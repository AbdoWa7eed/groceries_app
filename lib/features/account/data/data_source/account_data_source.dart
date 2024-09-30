import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/account/data/api/account_api_service.dart';
import 'package:groceries_app/features/account/data/models/profile_response.dart';

abstract class AccountDataSource {
  Future<BaseResponse> logout();

  Future<ProfileResponse> getProfile();
}

class AccountDataSourceImpl implements AccountDataSource {
  final AccountApiService _accountApiService;

  AccountDataSourceImpl(this._accountApiService);

  @override
  Future<BaseResponse> logout() async {
    return await _accountApiService.logout();
  }

  @override
  Future<ProfileResponse> getProfile() async {
    return await _accountApiService.getProfile();
  }
}
