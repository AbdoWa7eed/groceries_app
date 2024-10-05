import 'package:groceries_app/core/data/mapper/product_mapper.dart';
import 'package:groceries_app/core/network/api_error_messages.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/orders/data/models/order_response_model.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';

extension OrderResponseModelMapper on OrderResponseModel {
  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId.orZero(),
      orderDate: DateTime.parse(orderDate.orEmpty()),
      shippingDate: shippingDate != null ? DateTime.parse(shippingDate!) : null,
      shippingAddress: shippingAddress.orEmpty(),
      status: OrderStatus.values.firstWhere(
          (e) => e.name == status?.toLowerCase(),
          orElse: () => OrderStatus.processing),
      paymentMethod: PaymentMethodsEnum.values.firstWhere(
          (e) => e.name == paymentMethod?.toLowerCase(),
          orElse: () => PaymentMethodsEnum.other),
      paymentStatus: OrderPaymentStatus.values.firstWhere(
          (e) => e.name == paymentStatus?.toLowerCase(),
          orElse: () => OrderPaymentStatus.pending),
      totalPrice: totalPrice.orZero(),
      orderItems: orderItems?.map((item) => item.toEntity()).toList() ?? [],
      paymentLink: paymentLink.orEmpty(),
    );
  }
}

extension OrderItemResponseMapper on OrderItemResponse {
  OrderItemEntity toEntity() {
    if (product == null) {
      throw Failure.apiInternalError(ApiErrorMessages.unknownError);
    }
    return OrderItemEntity(
      orderId: orderId.orZero(),
      product: product!.toEntity(),
      quantity: quantity.orZero(),
    );
  }
}
