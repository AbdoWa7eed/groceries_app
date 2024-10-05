import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/orders/domain/repo/orders_repo.dart';

class CancelOrderUseCase extends BaseUseCase<int, String> {
  final OrdersRepository _orderRepository;

  CancelOrderUseCase(this._orderRepository);

  @override
  ResultFuture<String> execute(int input) {
    return _orderRepository.cancelOrder(input);
  }
}
