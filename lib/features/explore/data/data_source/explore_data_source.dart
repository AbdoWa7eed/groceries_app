import 'package:groceries_app/features/explore/data/api/explore_api_service.dart';
import 'package:groceries_app/features/explore/data/models/categories_response.dart';

abstract class ExploreDataSource {
  Future<CategoriesResponse> getCategories();
}

class ExploreDataSourceImpl implements ExploreDataSource {
  final ExploreApiService _exploreApiService;

  ExploreDataSourceImpl(this._exploreApiService);

  @override
  Future<CategoriesResponse> getCategories() {
    return _exploreApiService.getCategories();
  }
}
