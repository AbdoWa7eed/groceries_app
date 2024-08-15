import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/usecases/get_products_usecase.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getProductDetailsUseCase) : super(SearchInitial());

  final GetProductsUseCase _getProductDetailsUseCase;

  late String searchText;

  final List<ProductEntity> _products = [];

  List<ProductEntity> get products => _products;

  void getInitialProducts(String searchText) async {
    this.searchText = searchText;
    emit(GetInitialProductsLoading());
    final result =
        await _getProductDetailsUseCase.execute(GetProductsUseCaseInput(
      searchText: searchText,
    ));
    if (result.isRight()) {
      _products.clear();
      _products.addAll(result.right);
      emit(GetInitialProductsSuccess());
    } else {
      emit(GetInitialProductsError(result.failure.message));
    }
  }

  void getMoreProducts() async {
    final result =
        await _getProductDetailsUseCase.execute(GetProductsUseCaseInput(
      searchText: searchText,
      skip: _products.nextPage * 8,
    ));

    if (result.isRight()) {
      final newItems = _products.getOnlyNewItems(result.right);
      if (newItems.isEmpty) {
        emit(GetMoreProductsError(AppStrings.youReachedTheEnd));
        return;
      }
      _products.addAll(newItems);
      emit(GetMoreProductsSuccess());
    } else {
      emit(GetMoreProductsError(result.failure.message));
    }
  }
}
