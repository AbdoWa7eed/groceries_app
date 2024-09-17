import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/checkout/data/models/confirm_payment_request.dart';
import 'package:groceries_app/features/checkout/domain/repo/checkout_repository.dart';

class ConfirmPaymentUseCase
    extends BaseUseCase<ConfirmPaymentUseCaseInput, String> {
  final CheckoutRepository _checkoutRepository;

  ConfirmPaymentUseCase(this._checkoutRepository);

  @override
  ResultFuture<String> execute(ConfirmPaymentUseCaseInput input) {
    return _checkoutRepository.confirmPayment(input);
  }
}

class ConfirmPaymentUseCaseInput extends ConfirmPaymentRequest {
  ConfirmPaymentUseCaseInput(
      {required super.orderId, required super.paymentLink});
}
