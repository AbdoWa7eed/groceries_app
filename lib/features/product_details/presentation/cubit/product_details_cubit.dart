import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';
import 'package:groceries_app/features/product_details/domain/usecases/add_to_favorite_usecase.dart';
import 'package:groceries_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
      this._productDetailsUseCase, this._addProductToFavoritesUseCase)
      : super(ProductDetailsInitial());

  final GetProductDetailsUseCase _productDetailsUseCase;

  final AddProductToFavoritesUseCase _addProductToFavoritesUseCase;

  late ProductDetailsEntity _productDetailsEntity;

  ProductDetailsEntity get productDetailsEntity => _productDetailsEntity;

  void getProductDetails(int productId) async {
    emit(GetProductDetailsLoading());
    final result = await _productDetailsUseCase.execute(productId);

    if (result.isRight()) {
      _productDetailsEntity = result.right;
      emit(GetProductDetailsSuccess(result.right));
    } else {
      emit(GetProductDetailsError(result.failure.message));
    }
  }

  void addToFavorites() async {
    final result = await _addProductToFavoritesUseCase
        .execute(_productDetailsEntity.productId);
    if (result.isRight()) {
      emit(UpdateFavoriteSuccess(result.right));
    } else {
      emit(UpdateFavoriteError(result.failure.message));
    }
  }
}