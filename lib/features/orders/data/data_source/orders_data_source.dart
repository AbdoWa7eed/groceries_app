import 'package:groceries_app/features/orders/data/api/orders_api_service.dart';
import 'package:groceries_app/features/orders/data/models/order_response.dart';
import 'package:groceries_app/features/orders/data/models/orders_response.dart';

abstract class OrdersDataSource {
  Future<OrdersResponse> getOrders();

  Future<OrderResponse> cancelOrder(int orderId);
}

class OrdersDataSourceImpl implements OrdersDataSource {
  final OrdersApiService _ordersApiService;

  OrdersDataSourceImpl(this._ordersApiService);

  @override
  Future<OrdersResponse> getOrders() async {
    return _ordersApiService.getOrders();
  }

  @override
  Future<OrderResponse> cancelOrder(int orderId) async {
    return _ordersApiService.cancelOrder(orderId);
  }
}
