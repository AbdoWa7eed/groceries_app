import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';

class GetBannersUseCase extends BaseUseCase<void, List<BannerEntity>> {
  final ShopRepository _shopRepository;
  GetBannersUseCase(this._shopRepository);
  @override
  ResultFuture<List<BannerEntity>> execute([void input]) async {
    return await _shopRepository.getBanners();
  }
}
