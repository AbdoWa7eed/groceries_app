import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/checkout/domain/usecases/confirm_payment_usecase.dart';
import 'package:groceries_app/features/checkout/domain/usecases/place_order_usecase.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(
    this._placeOrderUseCase,
    this._confirmPaymentUseCase,
  ) : super(CheckoutInitial());

  final PlaceOrderUseCase _placeOrderUseCase;
  final ConfirmPaymentUseCase _confirmPaymentUseCase;

  late final PlaceOrderEntity _entity;

  void placeOrder() async {
    emit(PlaceOrderLoading());
    final result = await _placeOrderUseCase
        .execute(PlaceOrderUseCaseInput(paymentMethod: paymentMethod));
    if (result.isRight()) {
      _entity = result.right;
      if (_entity.paymentLink != null) {
        //TODO: Complete Order Payment Process
      }
      emit(PlaceOrderSuccess());
    } else {
      emit(PlaceOrderError(result.failure.message));
    }
  }

  confirmPayment() async {
    emit(ConfirmPaymentLoading());
    final result = await _confirmPaymentUseCase.execute(
        ConfirmPaymentUseCaseInput(
            orderId: _entity.orderId.toString(),
            paymentLink: _entity.paymentLink.toString()));
    if (result.isRight()) {
      emit(ConfirmPaymentSuccess());
    } else {
      emit(ConfirmPaymentError(result.failure.message));
    }
  }

  String? _paymentMethod;

  String get paymentMethod => _paymentMethod ?? PaymentMethodsEnum.paymob.name;

  setPaymentMethod(String method) {
    _paymentMethod = method;
    emit(ChangePaymentMethodState());
  }
}
