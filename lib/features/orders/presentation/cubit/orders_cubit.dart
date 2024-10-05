import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/domain/usecases/cancel_order_use_case.dart';
import 'package:groceries_app/features/orders/domain/usecases/get_orders_use_case.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._getOrdersUseCase, this._cancelOrderUseCase)
      : super(OrdersInitial());

  final GetOrdersUseCase _getOrdersUseCase;
  final CancelOrderUseCase _cancelOrderUseCase;

  final List<OrderEntity> orders = [];

  void getOrders() async {
    emit(GetOrdersLoading());
    final result = await _getOrdersUseCase.execute();
    if (result.isRight()) {
      orders.clear();
      orders.addAll(result.right);
      emit(OrdersSuccess());
    } else {
      emit(GetOrdersError(result.failure.message));
    }
  }

  void cancelOrder(int orderId) async {
    emit(CancelOrderLoading());
    _cancellingOrderId = orderId;
    final result = await _cancelOrderUseCase.execute(orderId);
    if (result.isRight()) {
      orders.removeWhere((order) => order.orderId == orderId);
      emit(OrdersSuccess<String>(result.right));
    } else {
      emit(CancelOrdersError(result.failure.message));
    }
  }

  int? _cancellingOrderId;
  int? get cancellingOrderId => _cancellingOrderId;
}
