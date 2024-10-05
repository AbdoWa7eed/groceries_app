import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/domain/repo/orders_repo.dart';

class GetOrdersUseCase extends BaseUseCase<void, List<OrderEntity>> {
  final OrderRepository _orderRepository;

  GetOrdersUseCase(this._orderRepository);

  @override
  ResultFuture<List<OrderEntity>> execute([void input]) {
    return _orderRepository.getOrders();
  }
}
