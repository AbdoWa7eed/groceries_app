import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/explore/domain/repo/explore_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<void, List<CategoryEntity>> {
  final ExploreRepository _exploreRepository;
  GetCategoriesUseCase(this._exploreRepository);

  @override
  ResultFuture<List<CategoryEntity>> execute([void input]) {
    return _exploreRepository.getCategories();
  }
}
