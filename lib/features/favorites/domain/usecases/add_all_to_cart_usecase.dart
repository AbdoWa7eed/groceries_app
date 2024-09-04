import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/domain/usecases/add_to_cart_usecase.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class AddAllToCartUseCase
    extends BaseUseCase<AddAllToCartUseCaseInput, String> {
  final CartRepository _cartRepository;
  AddAllToCartUseCase(this._cartRepository);
  @override
  ResultFuture<String> execute(AddAllToCartUseCaseInput input) {
    return _cartRepository.addAllToCart(input.products);
  }
}

class AddAllToCartUseCaseInput {
  final List<CartUseCaseInput> products;
  AddAllToCartUseCaseInput(this.products);
}
