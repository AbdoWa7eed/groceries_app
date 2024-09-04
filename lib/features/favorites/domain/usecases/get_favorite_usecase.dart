import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/repo/favorite_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class GetFavoriteUseCase extends BaseUseCase<void, List<ProductEntity>> {
  final FavoriteRepository _favoriteRepository;

  GetFavoriteUseCase(this._favoriteRepository);

  @override
  ResultFuture<List<ProductEntity>> execute([void input]) {
    return _favoriteRepository.getFavorites();
  }
}
