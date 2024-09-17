import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_order_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PlaceOrderResponseModel extends BaseResponse {
  final PlaceOrderResponseData? data;
  PlaceOrderResponseModel({
    required super.message,
    required this.data,
  });
  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PlaceOrderResponseData {
  int orderId;
  String? paymentLink;
  PlaceOrderResponseData({required this.orderId, this.paymentLink});

  factory PlaceOrderResponseData.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseDataFromJson(json);
}
