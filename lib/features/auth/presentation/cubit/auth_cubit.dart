import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._loginUseCase, this._appPreferences) : super(AuthInitial());

  final LoginUseCase _loginUseCase;
  final AppPreferences _appPreferences;

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final data = await _loginUseCase
        .execute(LoginUseCaseInput(email: email, password: password));
    if (data.isRight()) {
      await _setTokens(data.right.accessToken, data.right.refreshToken);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(data.failure.message));
    }
  }

  _setTokens(String accessToken, String refreshToken) async {
    await _appPreferences.setUserAccessToken(accessToken);
    await _appPreferences.setUserRefreshToken(refreshToken);
  }
}
