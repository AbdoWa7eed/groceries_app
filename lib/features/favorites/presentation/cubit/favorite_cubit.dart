import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/usecases/add_to_cart_usecase.dart';
import 'package:groceries_app/core/domain/usecases/remove_favorite_usecase.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/favorites/domain/usecases/add_all_to_cart_usecase.dart';
import 'package:groceries_app/features/favorites/domain/usecases/get_favorite_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this._favoriteUseCase,
    this._removeFromFavoriteUseCase,
    this._addAllToCartUseCase,
  ) : super(FavoriteInitial());

  final GetFavoriteUseCase _favoriteUseCase;
  final RemoveFromFavoriteUseCase _removeFromFavoriteUseCase;
  final AddAllToCartUseCase _addAllToCartUseCase;

  List<ProductEntity>? _favorites;

  List<ProductEntity> get favorites => _favorites!;

  void initFavorite() async {
    if (_favorites == null || _favorites!.isEmpty) {
      await getFavorite();
    }
  }

  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    final result = await _favoriteUseCase.execute();
    if (result.isRight()) {
      _favorites = result.right;
      emit(FavoriteSuccess());
    } else {
      emit(FavoriteError(result.failure.message));
    }
  }

  Future<void> removeFromFavorite(ProductEntity product) async {
    final index =
        _favorites!.indexWhere((e) => e.productId == product.productId);
    _favorites!.removeAt(index);
    emit(RemoveFromFavoriteLoading());
    final result = await _removeFromFavoriteUseCase.execute(product.productId);
    if (result.isRight()) {
      emit(RemoveFromFavoriteSuccess(result.right));
    } else {
      _favorites!.insert(index, product);
      if (result.failure.code == 400) {
        emit(RemoveFromFavoriteError('Item already deleted refresh the page'));
        return;
      }
      emit(RemoveFromFavoriteError(result.failure.message));
    }
  }

  Future<void> addAllToCart() async {
    final result =
        await _addAllToCartUseCase.execute(_createCartUseCaseInput());
    if (result.isRight()) {
      emit(AddAllToCartSuccess(result.right));
    } else {
      emit(AddAllToCartError(result.failure.message));
    }
  }

  AddAllToCartUseCaseInput _createCartUseCaseInput() {
    final inputs = _favorites!
        .map((e) => CartUseCaseInput(productId: e.productId))
        .toList();
    return AddAllToCartUseCaseInput(inputs);
  }
}
