import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/checkout/domain/usecases/confirm_payment_usecase.dart';

part 'confirm_payment_state.dart';

class ConfirmPaymentCubit extends Cubit<ConfirmPaymentState> {
  ConfirmPaymentCubit(this._confirmPaymentUseCase)
      : super(ConfirmPaymentInitial());

  final ConfirmPaymentUseCase _confirmPaymentUseCase;

  late final PlaceOrderEntity _entity;

  late String currentUrl;

  void setEntity(PlaceOrderEntity entity) {
    _entity = entity;
    currentUrl = entity.paymentLink!;
  }

  confirmPayment() async {
    final result = await _confirmPaymentUseCase.execute(
      ConfirmPaymentUseCaseInput(
        orderId: _entity.orderId.toString(),
        paymentLink: _entity.paymentLink.toString(),
      ),
    );
    if (result.isRight()) {
      emit(ConfirmPaymentSuccess());
    } else {
      emit(ConfirmPaymentError(result.failure.message));
    }
  }

  void updateUrl(String url) {
    currentUrl = url;
    emit(ChangeUrlState());
  }

  Map<String, dynamic> _getQueryParameters() {
    final uri = Uri.parse(currentUrl);
    return uri.queryParameters;
  }

  PaymentUrlType getUrlType() {
    final queryParameters = _getQueryParameters();
    final isRedirect = queryParameters.containsKey('payment_token') &&
        queryParameters.containsKey('trx_id');
    if (isRedirect) {
      return PaymentUrlType.redirect;
    } else if (queryParameters['success'] == 'true') {
      return PaymentUrlType.success;
    } else {
      return PaymentUrlType.pending;
    }
  }

  double _progress = 0;

  double get progress => _progress;
  void updateProgress(int progress) {
    _progress = progress / 100;
    emit(ChangeProgressState());
  }
}
