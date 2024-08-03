import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/product_details/domain/repo/product_details_repo.dart';

class AddProductToFavoritesUseCase extends BaseUseCase<int, String> {
  final ProductDetailsRepository _productDetailsRepository;

  AddProductToFavoritesUseCase(this._productDetailsRepository);

  @override
  ResultFuture<String> execute(int input) {
    return _productDetailsRepository.addToFavorites(input);
  }
}
