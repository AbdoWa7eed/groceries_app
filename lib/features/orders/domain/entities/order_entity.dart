import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/utils/enums.dart';

class OrderEntity {
  final int orderId;
  final DateTime orderDate;
  final DateTime? shippingDate;
  final String shippingAddress;
  final OrderStatus status;
  final PaymentMethodsEnum paymentMethod;
  final OrderPaymentStatus? paymentStatus;
  final double totalPrice;
  final List<OrderItemEntity> orderItems;
  final String? paymentLink;

  OrderEntity({
    required this.orderId,
    required this.orderDate,
    this.shippingDate,
    required this.shippingAddress,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.totalPrice,
    required this.orderItems,
    this.paymentLink,
  });
}

class OrderItemEntity {
  final int orderId;
  final ProductEntity product;
  final int quantity;

  OrderItemEntity({
    required this.orderId,
    required this.product,
    required this.quantity,
  });
}
