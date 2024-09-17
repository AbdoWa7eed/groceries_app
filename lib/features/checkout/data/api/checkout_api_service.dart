import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_request_model.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_response_model.dart';
import 'package:retrofit/http.dart';

part 'checkout_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CheckoutApiService {
  factory CheckoutApiService(Dio dio, {String? baseUrl}) = _CheckoutApiService;

  @POST('orders')
  Future<PlaceOrderResponseModel> placeOrder(
    @Body() OrderRequestModel orderRequestModel,
  );

  @POST('orders/{orderId}/confirm_payment')
  Future<BaseResponse> confirmPayment(
    @Path('orderId') String orderId,
    @Field() String paymentLink,
  );
}
