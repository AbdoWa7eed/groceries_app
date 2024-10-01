import 'package:groceries_app/core/data/models/profile/profile_response.dart';
import 'package:groceries_app/features/profile/data/api/profile_api_service.dart';
import 'package:groceries_app/features/profile/data/models/update_user_request.dart';

abstract class ProfileDataSource {
  Future<ProfileResponse> updateProfile(UpdateUserRequest updateUserRequest);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final ProfileApiService _profileApiService;

  ProfileDataSourceImpl(this._profileApiService);
  @override
  Future<ProfileResponse> updateProfile(UpdateUserRequest updateUserRequest) {
    return _profileApiService.updateProfile(updateUserRequest);
  }
}
