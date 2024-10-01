import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileUseCase) : super(ProfileInitial());

  final UpdateProfileUseCase _profileUseCase;

  late UserEntity _user;

  UserEntity get user => _user;

  void setUser(UserEntity user) {
    _user = user;
  }

  void updateProfile({
    required String username,
    required String email,
  }) async {
    emit(UpdateProfileLoading());

    if (!hasChanges(username, email)) {
      emit(UpdateProfileError(AppStrings.noChanges));
      return;
    }

    final result = await _profileUseCase.execute(UpdateProfileUseCaseInput(
      username: _getUpdatedValue(_user.username, username),
      email: _getUpdatedValue(_user.email, email),
      image: image,
    ));

    if (result.isRight()) {
      _user = result.right;
      emit(UpdateProfileSuccess());
    } else {
      emit(UpdateProfileError(result.failure.message));
    }
  }

  String? _getUpdatedValue(String oldValue, String newValue) {
    return oldValue != newValue ? newValue : null;
  }

  bool hasChanges(String username, String email) {
    return username != _user.username ||
        email != _user.email ||
        (image != null);
  }

  File? image;

  void pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      emit(SetProfileImage());
    }
  }

  void pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      this.image = File(image.path);
      emit(SetProfileImage());
    }
  }
}
