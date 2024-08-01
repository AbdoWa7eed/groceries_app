import 'package:groceries_app/core/entities/product_entity.dart';
import 'package:groceries_app/core/models/product_request_params.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';

class GetGroceriesUseCase
    extends BaseUseCase<GetGroceriesUsecaseInput, List<ProductEntity>> {
  final ShopRepository _shopRepository;
  GetGroceriesUseCase(this._shopRepository);
  @override
  ResultFuture<List<ProductEntity>> execute(
      [GetGroceriesUsecaseInput? input]) async {
    return await _shopRepository
        .getGroceries(input ?? GetGroceriesUsecaseInput());
  }
}

class GetGroceriesUsecaseInput extends ProductsRequestParams {
  GetGroceriesUsecaseInput({
    super.skip = 0,
    super.take = 8,
  });
}
