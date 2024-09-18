import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_request_model.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/checkout/domain/repo/checkout_repository.dart';

class PlaceOrderUseCase
    extends BaseUseCase<PlaceOrderUseCaseInput, PlaceOrderEntity> {
  final CheckoutRepository _checkoutRepository;

  PlaceOrderUseCase(this._checkoutRepository);

  @override
  ResultFuture<PlaceOrderEntity> execute(PlaceOrderUseCaseInput input) {
    return _checkoutRepository.placeOrder(input);
  }
}

class PlaceOrderUseCaseInput extends OrderRequestModel {
  PlaceOrderUseCaseInput({required super.paymentMethod, super.shippingAddress});
}
