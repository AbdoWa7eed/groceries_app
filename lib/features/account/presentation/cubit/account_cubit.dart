import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/account/domain/usecase/get_profile_usecase.dart';
import 'package:groceries_app/features/account/domain/usecase/logout_usecase.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(
    this._getProfileUseCase,
    this._logoutUseCase,
    this._appPreferences,
  ) : super(AccountInitial());

  final GetProfileUseCase _getProfileUseCase;

  final LogoutUseCase _logoutUseCase;

  final AppPreferences _appPreferences;

  late UserEntity user;

  void getProfile() async {
    emit(AccountLoading());
    final result = await _getProfileUseCase.execute();

    if (result.isRight()) {
      user = result.right;
      emit(AccountSuccess());
    } else {
      emit(AccountError(error: result.failure.message));
    }
  }

  void logout() async {
    emit(AccountLogoutLoading());
    final result = await _logoutUseCase.execute();
    result.fold(
      (failure) => emit(AccountLogoutError(error: failure.message)),
      (message) async {
        await _appPreferences.logout();
        emit(AccountLogoutSuccess());
      },
    );
  }
}
