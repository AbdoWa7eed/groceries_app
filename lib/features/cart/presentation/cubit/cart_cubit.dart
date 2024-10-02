import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/domain/usecases/add_to_cart_usecase.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:groceries_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:groceries_app/features/cart/domain/usecases/update_item_quantity_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addToCartUsecase,
    this._updateItemQuantityUsecase,
    this._getCartUsecase,
    this._removeFromCartUsecase,
  ) : super(CartInitial());

  final AddToCartUseCase _addToCartUsecase;
  final UpdateItemQuantityUseCase _updateItemQuantityUsecase;
  final GetCartUseCase _getCartUsecase;
  final RemoveFromCartUseCase _removeFromCartUsecase;

  CartEntity? _cart;

  CartEntity get cart => _cart!;

  void initCart() async {
    if (_cart == null || _cart!.cartItems.isEmpty) {
      await getCart();
    }
  }

  Future getCart() async {
    emit(CartLoading());
    final result = await _getCartUsecase.execute();
    if (result.isRight()) {
      _cart = result.right;
      emit(CartSuccess());
    } else {
      emit(CartError(result.failure.message));
    }
  }

  void addToCart(int productId, {int quantity = 1}) async {
    final result = await _addToCartUsecase
        .execute(CartUseCaseInput(productId: productId, quantity: quantity));
    if (result.isRight()) {
      emit(AddToCartSuccess(result.right));
    } else {
      emit(AddToCartError(result.failure.message));
    }
  }

  void removeFromCart(int productId) async {
    final result = await _removeFromCartUsecase.execute(productId);
    if (result.isRight()) {
      _cart!.cartItems
          .removeWhere((element) => element.product.productId == productId);
      emit(RemoveFromCartSuccess(result.right));
    } else {
      emit(RemoveFromCartError(result.failure.message));
    }
  }

  void updateItemQuantity(int productId, int quantity) async {
    final result = await _updateItemQuantityUsecase
        .execute(CartUseCaseInput(productId: productId, quantity: quantity));
    if (result.isRight()) {
      _updateQuantity(productId, quantity);
      emit(UpdateCartItemSuccess(result.right));
    } else {
      emit(UpdateCartItemError(result.failure.message));
    }
  }

  _updateQuantity(int productId, int quantity) {
    final index = _cart!.cartItems
        .indexWhere((element) => element.product.productId == productId);
    final updatedItem = CartItemEntity(
      product: _cart!.cartItems[index].product,
      quantity: quantity,
    );
    _cart!.cartItems[index] = updatedItem;
  }

  String get cartPrice => _cart!.cartItems.isEmpty
      ? '0.0'
      : _cart!.cartItems
          .map((e) => e.product.price * e.quantity)
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
}
