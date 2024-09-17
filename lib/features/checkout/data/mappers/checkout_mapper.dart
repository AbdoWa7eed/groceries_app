import 'package:groceries_app/features/checkout/data/models/place_order_response_model.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';

extension CheckoutMapper on PlaceOrderResponseData {
  PlaceOrderEntity toEntity() {
    return PlaceOrderEntity(
      orderId: orderId,
      paymentLink: paymentLink,
    );
  }
}
