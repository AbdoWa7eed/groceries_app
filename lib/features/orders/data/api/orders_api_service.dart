import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/orders/data/models/order_response.dart';
import 'package:groceries_app/features/orders/data/models/orders_response.dart';
import 'package:retrofit/http.dart';

part 'orders_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OrdersApiService {
  factory OrdersApiService(Dio dio, {String? baseUrl}) = _OrdersApiService;

  @GET('/orders')
  Future<OrdersResponse> getOrders();

  @DELETE('/orders/{orderId}')
  Future<OrderResponse> cancelOrder(@Path('orderId') int orderId);
}
