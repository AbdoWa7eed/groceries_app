import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class AddToCartUseCase extends BaseUseCase<CartUsecaseInput, String> {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);
  @override
  ResultFuture<String> execute(CartUsecaseInput input) {
    return _cartRepository.addToCart(input);
  }
}

class CartUsecaseInput extends CartRequestBody {
  CartUsecaseInput({required super.productId, int? quantity})
      : super(quantity: quantity ?? 1);
}
