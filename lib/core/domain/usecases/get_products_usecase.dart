import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/repo/products_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class GetProductsUseCase
    extends BaseUseCase<GetProductsUseCaseInput, List<ProductEntity>> {
  final ProductsRepository _productsRepository;
  GetProductsUseCase(this._productsRepository);

  @override
  ResultFuture<List<ProductEntity>> execute([GetProductsUseCaseInput? input]) {
    return _productsRepository.getProducts(input ?? GetProductsUseCaseInput());
  }
}

class GetProductsUseCaseInput extends ProductsRequestParams {
  GetProductsUseCaseInput({
    super.skip,
    super.take,
    super.searchText,
    super.categoryId,
    super.categoryName,
  });
}
