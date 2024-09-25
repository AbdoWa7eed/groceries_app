import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/checkout/domain/usecases/place_order_usecase.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(
    this._placeOrderUseCase,
  ) : super(CheckoutInitial());

  final PlaceOrderUseCase _placeOrderUseCase;

  void placeOrder() async {
    emit(PlaceOrderLoading());
    final result = await _placeOrderUseCase.execute(PlaceOrderUseCaseInput(
        paymentMethod: paymentMethod, shippingAddress: deliveryAddress));
    if (result.isRight()) {
      emit(PlaceOrderSuccess(result.right));
    } else {
      emit(PlaceOrderError(result.failure.message));
    }
  }

  String? _paymentMethod;

  String? deliveryAddress;

  String get paymentMethod => _paymentMethod ?? PaymentMethodsEnum.paymob.name;

  setPaymentMethod(String method) {
    _paymentMethod = method;
    emit(ChangePaymentMethodState());
  }
}
