import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';

abstract class OrderRepository {
  ResultFuture<List<OrderEntity>> getOrders();
  ResultFuture<String> cancelOrder(int orderId);
}
