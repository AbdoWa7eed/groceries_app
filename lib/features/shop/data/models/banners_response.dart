import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banners_response.g.dart';
@JsonSerializable(createToJson: false)
class BannersResponse extends BaseResponse{
  BannersResponseData? data;

  BannersResponse({required super.message, this.data});

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class BannersResponseData {
  int? itemCount;
  List<BannerModel>? items;

  BannersResponseData({this.itemCount, this.items});

  factory BannersResponseData.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class BannerModel {
  int? id;
  String? imageUrl;

  BannerModel({this.id, this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
