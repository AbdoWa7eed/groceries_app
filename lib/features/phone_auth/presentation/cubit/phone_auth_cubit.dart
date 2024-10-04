import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/phone_auth/domain/usecase/send_otp_usecase.dart';
import 'package:groceries_app/features/phone_auth/domain/usecase/verify_phone_usecase.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit(this._sendOTPUsecase, this._verifyPhoneUsecase)
      : super(PhoneAuthInitial());

  final SendOTPUsecase _sendOTPUsecase;
  final VerifyPhoneUsecase _verifyPhoneUsecase;

  late PhoneAuthPurpose _purpose;

  void setPurpose(PhoneAuthPurpose purpose) {
    _purpose = purpose;
  }

  PhoneAuthPurpose get purpose => _purpose;

  String? verificationId;
  late String? _phoneNumber;

  void sendOTP([String? phoneNumber]) async {
    _phoneNumber = phoneNumber;
    emit(SendOTPLoadingState());
    final data = await _sendOTPUsecase.execute(_phoneNumber!);

    if (data.isRight()) {
      verificationId = data.right.verificationId;
      emit(SendOTPSuccessState());
      return;
    } else {
      emit(SendOTPErrorState(data.failure.message));
    }
  }

  void verifyOTP({required String code}) async {
    emit(VerifyOTPLoadingState());
    final data = await _verifyPhoneUsecase.execute(VerifyPhoneUsecaseInput(
        verificationId: verificationId ?? '', code: code));
    if (data.isRight()) {
      emit(VerifyOTPSuccessState());
      return;
    } else {
      emit(VerifyOTPErrorState(data.failure.message));
    }
  }

  @override
  Future<void> close() {
    getIt.unregister<PhoneAuthCubit>();
    return super.close();
  }
}
