import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/shop/data/models/banners_response.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';

extension BannerMapperExtension on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(bannerId: id.orZero(), imageUrl: imageUrl.orEmpty());
  }
}
