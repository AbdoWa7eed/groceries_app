import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/network/dio_factory.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:groceries_app/features/auth/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._loginUseCase, this._registerUseCase, this._appPreferences)
      : super(AuthInitial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
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

  void register(
      {required String email,
      required String username,
      required String password}) async {
    emit(RegisterLoadingState());
    final data = await _registerUseCase.execute(RegisterUseCaseInput(
        email: email, password: password, username: username));
    if (data.isRight()) {
      await _setTokens(data.right.accessToken, data.right.refreshToken);
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState(data.failure.message));
    }
  }

  _setTokens(String accessToken, String refreshToken) {
    DioFactory.setTokenIntoHeader(accessToken);
    _appPreferences.setUserAccessToken(accessToken);
    _appPreferences.setUserRefreshToken(refreshToken);
  }
}
