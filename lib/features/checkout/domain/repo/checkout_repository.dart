import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/checkout/data/models/confirm_payment_request.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_request_model.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';

abstract class CheckoutRepository {
  ResultFuture<PlaceOrderEntity> placeOrder(
      OrderRequestModel orderRequestModel);
  ResultFuture<String> confirmPayment(ConfirmPaymentRequest request);
}
