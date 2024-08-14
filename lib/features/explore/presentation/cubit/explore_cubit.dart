import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/explore/domain/usecases/get_categories_usecase.dart';
import 'package:groceries_app/features/explore/domain/usecases/get_category_products_usecase.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._getCategoriesUseCase, this._getCategoryProductsUseCase)
      : super(ExploreInitial());

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetCategoryProductsUseCase _getCategoryProductsUseCase;

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
        GetCategoryProductsUseCaseInput(
            categoryId: categoryId, skip: page * 8));
    if (result.isRight()) {
      _products.addAll(result.right);
      emit(GetCategoryProductsSuccess());
    } else {
      emit(GetCategoryProductsError(result.failure.message));
    }
  }
}
