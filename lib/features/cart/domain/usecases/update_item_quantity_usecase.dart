import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/domain/usecases/add_to_cart_usecase.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class UpdateItemQuantityUseCase extends BaseUseCase<CartUsecaseInput, String> {
  final CartRepository _cartRepository;

  UpdateItemQuantityUseCase(this._cartRepository);
  @override
  ResultFuture<String> execute(CartUsecaseInput input) {
    return _cartRepository.updateItemQuantity(input);
  }
}
