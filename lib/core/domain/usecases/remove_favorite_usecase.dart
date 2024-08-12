import 'package:groceries_app/core/domain/repo/favorite_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class RemoveFromFavoriteUseCase extends BaseUseCase<int, String> {
  final FavoriteRepository _favoriteRepository;

  RemoveFromFavoriteUseCase(this._favoriteRepository);

  @override
  ResultFuture<String> execute(int input) {
    return _favoriteRepository.removeFavorite(input);
  }
}
