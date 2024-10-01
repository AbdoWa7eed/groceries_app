


import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/profile/data/models/update_user_request.dart';
import 'package:groceries_app/features/profile/domain/repo/profile_repository.dart';

class UpdateProfileUseCase extends BaseUseCase<UpdateProfileUseCaseInput , UserEntity>{
  final ProfileRepository _profileRepository;
  UpdateProfileUseCase(this._profileRepository);
  @override
  ResultFuture<UserEntity> execute(UpdateProfileUseCaseInput input) {
    return _profileRepository.updateProfile(input);
  }
}


class UpdateProfileUseCaseInput extends UpdateUserRequest {
  UpdateProfileUseCaseInput({required super.username, required super.email, required super.image});
}