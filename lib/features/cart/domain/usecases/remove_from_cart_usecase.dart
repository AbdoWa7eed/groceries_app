import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class RemoveFromCartUsecase extends BaseUseCase<int, String> {
  final CartRepository _cartRepository;

  RemoveFromCartUsecase(this._cartRepository);
  @override
  ResultFuture<String> execute(int input) {
    return _cartRepository.removeFromCart(input);
  }
}
