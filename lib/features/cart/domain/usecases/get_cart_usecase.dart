import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';

class GetCartUseCase extends BaseUseCase<void, CartEntity> {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);
  @override
  ResultFuture<CartEntity> execute([void input]) {
    return _cartRepository.getCart();
  }
}
