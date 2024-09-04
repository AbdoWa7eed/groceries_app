import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class AddToCartUseCase extends BaseUseCase<CartUseCaseInput, String> {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);
  @override
  ResultFuture<String> execute(CartUseCaseInput input) {
    return _cartRepository.addToCart(input);
  }
}

class CartUseCaseInput extends CartRequestBody {
  CartUseCaseInput({required super.productId, int? quantity})
      : super(quantity: quantity ?? 1);
}
