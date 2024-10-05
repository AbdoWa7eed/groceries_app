import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/orders/data/data_source/orders_data_source.dart';
import 'package:groceries_app/features/orders/data/mappers/order_mapper.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/domain/repo/orders_repo.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersDataSource _orderDataSource;

  OrdersRepositoryImpl(this._orderDataSource);

  @override
  ResultFuture<List<OrderEntity>> getOrders() async {
    try {
      final result = await _orderDataSource.getOrders();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
          result.data!.orders.map((order) => order.toEntity()).toList());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> cancelOrder(int orderId) async {
    try {
      final result = await _orderDataSource.cancelOrder(orderId);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
