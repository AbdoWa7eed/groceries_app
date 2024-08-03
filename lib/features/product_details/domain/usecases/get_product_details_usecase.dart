import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';
import 'package:groceries_app/features/product_details/domain/repo/product_details_repo.dart';

class GetProductDetailsUseCase extends BaseUseCase<int, ProductDetailsEntity> {
  final ProductDetailsRepository _productDetailsRepository;

  GetProductDetailsUseCase(this._productDetailsRepository);

  @override
  ResultFuture<ProductDetailsEntity> execute(int input) {
    return _productDetailsRepository.getProductDetails(input);
  }
}
