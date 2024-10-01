import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/change_password/data/api/change_password_api_service.dart';
import 'package:groceries_app/features/change_password/data/models/change_password_request.dart';

abstract class ChangePasswordDataSource {
  Future<BaseResponse> changePassword(ChangePasswordRequest request);
}

class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  final ChangePasswordApiService _apiService;

  ChangePasswordDataSourceImpl(this._apiService);
  @override
  Future<BaseResponse> changePassword(ChangePasswordRequest request) {
    return _apiService.changePassword(request);
  }
}
