import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/change_password/domain/usecase/change_password_usecase.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordInitial());

  final ChangePasswordUseCase _changePasswordUseCase;

  void changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result =
        await _changePasswordUseCase.execute(ChangePasswordUseCaseInput(
      oldPassword: currentPassword,
      newPassword: newPassword,
    ));

    if (result.isRight()) {
      emit(ChangePasswordSuccess(result.right));
    } else {
      emit(ChangePasswordError(result.failure.message));
    }
  }
}
