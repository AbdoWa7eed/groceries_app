import 'package:groceries_app/core/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';

class GetBestSellingUseCase extends BaseUseCase<void, List<ProductEntity>> {
  final ShopRepository _shopRepository;
  GetBestSellingUseCase(this._shopRepository);
  @override
  ResultFuture<List<ProductEntity>> execute([void input]) async {
    return await _shopRepository.getBestSelling();
  }
}
