import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/usecases/get_products_usecase.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/explore/domain/usecases/get_categories_usecase.dart';
part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._getCategoriesUseCase, this._getCategoryProductsUseCase)
      : super(ExploreInitial());

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsUseCase _getCategoryProductsUseCase;

  final List<CategoryEntity> _categories = [];

  List<CategoryEntity> get categories => _categories;

  void getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategoriesUseCase.execute();
    if (result.isRight()) {
      _categories.addAll(result.right);
      emit(GetCategoriesSuccess());
    } else {
      emit(GetCategoriesError(result.failure.message));
    }
  }

  final List<ProductEntity> _products = [];

  List<ProductEntity> get products => _products;
  getCategoryProducts({
    required int categoryId,
    int page = 0,
  }) async {
    emit(GetCategoryProductsLoading());
    if (page == 0) {
      _products.clear();
    }
    final result = await _getCategoryProductsUseCase.execute(
        GetProductsUseCaseInput(categoryId: categoryId, skip: page * 8));
    if (result.isRight()) {
      final newItems = _products.getOnlyNewItems(result.right);
      if (newItems.isEmpty && page != 0) {
        emit(GetCategoryProductsError(AppStrings.youReachedTheEnd));
        return;
      }
      _products.addAll(result.right);
      emit(GetCategoryProductsSuccess());
    } else {
      emit(GetCategoryProductsError(result.failure.message));
    }
  }
}
