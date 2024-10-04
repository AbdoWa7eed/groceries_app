import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/network/dio_factory.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/forget_password/domain/usecases/reset_password_usecase.dart';
import 'package:groceries_app/features/forget_password/domain/usecases/send_verification_code_usecase.dart';
import 'package:groceries_app/features/forget_password/domain/usecases/verify_email_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this._emailVerificationCodeUseCase,
    this._verifyEmailUseCase,
    this._resetPasswordUseCase,
    this._appPreferences,
  ) : super(ForgetPasswordInitial());

  final SendEmailVerificationCodeUseCase _emailVerificationCodeUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final AppPreferences _appPreferences;

  late final String verificationId;

  void sendEmailVerificationCode(String email) async {
    emit(ForgetPasswordLoading());
    final result = await _emailVerificationCodeUseCase.execute(email);
    result.fold(
      (failure) => emit(ForgetPasswordError(failure.message)),
      (otpEntity) {
        logInfo(otpEntity.verificationId);
        verificationId = otpEntity.verificationId;
        emit(ForgetPasswordSuccess());
      },
    );
  }

  void verifyEmail(String code) async {
    emit(ForgetPasswordLoading());
    final result = await _verifyEmailUseCase.execute(VerifyEmailUseCaseInput(
      verificationId: verificationId,
      code: code,
    ));
    result.fold(
      (failure) => emit(ForgetPasswordError(failure.message)),
      (otpEntity) => emit(ForgetPasswordSuccess<String>(otpEntity.message)),
    );
  }

  void resetPassword(String password) async {
    emit(ForgetPasswordLoading());
    final result =
        await _resetPasswordUseCase.execute(ResetPasswordUseCaseInput(
      password: password,
      verificationId: verificationId,
    ));
    result.fold((failure) => emit(ForgetPasswordError(failure.message)),
        (authEntity) async {
      await _setUserTokens(authEntity);
      emit(ForgetPasswordSuccess<AuthEntity>(authEntity));
    });
  }

  _setUserTokens(AuthEntity entity) async {
    DioFactory.setTokenIntoHeader(entity.accessToken);
    await _appPreferences.setUserAccessToken(entity.accessToken);
    await _appPreferences.setUserRefreshToken(entity.refreshToken);
  }

  @override
  Future<void> close() {
    unregisterForgetPasswordDi();
    return super.close();
  }
}
