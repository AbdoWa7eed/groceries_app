part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class GetOrdersLoading extends OrdersState {}

final class OrdersSuccess<T> extends OrdersState {
  final T? data;
  OrdersSuccess([this.data]);
}

final class GetOrdersError extends OrdersState {
  final String error;
  GetOrdersError(this.error);
}

final class CancelOrderLoading extends OrdersState {}

final class CancelOrdersError extends OrdersState {
  final String error;
  CancelOrdersError(this.error);
}
