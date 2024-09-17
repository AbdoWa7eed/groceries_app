// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderRequestModelToJson(OrderRequestModel instance) {
  final val = <String, dynamic>{
    'paymentMethod': instance.paymentMethod,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shippingAddress', instance.shippingAddress);
  return val;
}
