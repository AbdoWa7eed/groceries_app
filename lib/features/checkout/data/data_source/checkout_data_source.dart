import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/features/checkout/data/api/checkout_api_service.dart';
import 'package:groceries_app/features/checkout/data/models/confirm_payment_request.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_request_model.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_response_model.dart';

abstract class CheckoutDataSource {
  Future<PlaceOrderResponseModel> placeOrder(
    OrderRequestModel orderRequestModel,
  );

  Future<BaseResponse> confirmPayment(ConfirmPaymentRequest request);
}

class CheckoutDataSourceImpl implements CheckoutDataSource {
  final CheckoutApiService _checkoutApiService;

  CheckoutDataSourceImpl(this._checkoutApiService);

  @override
  Future<BaseResponse> confirmPayment(ConfirmPaymentRequest request) {
    return _checkoutApiService.confirmPayment(
        request.orderId, request.paymentLink);
  }

  @override
  Future<PlaceOrderResponseModel> placeOrder(
      OrderRequestModel orderRequestModel) {
    return _checkoutApiService.placeOrder(orderRequestModel);
  }
}
