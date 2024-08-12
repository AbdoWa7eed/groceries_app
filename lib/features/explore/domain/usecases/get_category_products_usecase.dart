import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/explore/domain/repo/explore_repository.dart';

class GetCategoryProductsUseCase
    extends BaseUseCase<GetCategoryProductsUseCaseInput, List<ProductEntity>> {
  final ExploreRepository _exploreRepository;
  GetCategoryProductsUseCase(this._exploreRepository);

  @override
  ResultFuture<List<ProductEntity>> execute(
      GetCategoryProductsUseCaseInput input) {
    return _exploreRepository.getCategoryProducts(input);
  }
}

class GetCategoryProductsUseCaseInput extends ProductsRequestParams {
  GetCategoryProductsUseCaseInput({
    required super.categoryId,
    super.skip = 0,
    super.take = 8,
  });
}
