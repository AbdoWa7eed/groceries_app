import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/usecases/get_products_usecase.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_banners_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_best_selling_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_exclusive_offers_usecase.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this._getBestSellingUseCase, this._getExclusiveOffersUseCase,
      this._getGroceriesUseCase, this._getBannersUseCase)
      : super(ShopInitial());

  final GetBestSellingUseCase _getBestSellingUseCase;
  final GetExclusiveOffersUseCase _getExclusiveOffersUseCase;
  final GetProductsUseCase _getGroceriesUseCase;
  final GetBannersUseCase _getBannersUseCase;

  final List<ProductEntity> bestSelling = [];
  final List<ProductEntity> exclusiveOffers = [];
  final List<ProductEntity> groceries = [];
  final List<BannerEntity> banners = [];

  Future<void> initShopData() async {
    emit(ShopLoading());
    final bestSellingResult =
        await _fetchData(_getBestSellingUseCase.execute, bestSelling);
    final exclusiveOffersResult =
        await _fetchData(_getExclusiveOffersUseCase.execute, exclusiveOffers);
    final groceriesResult =
        await _fetchData(_getGroceriesUseCase.execute, groceries);
    final bannersResult = await _fetchData(_getBannersUseCase.execute, banners);

    final results = [
      bestSellingResult,
      exclusiveOffersResult,
      groceriesResult,
      bannersResult
    ];

    final error =
        results.firstWhere((result) => result != null, orElse: () => null);
    if (error != null) {
      emit(ShopError(error));
    } else {
      emit(ShopSuccess());
    }
  }

  Future<String?> _fetchData<T>(
      ResultFuture<List<T>> Function() useCase, List<T> targetList) async {
    final result = await useCase();
    if (result.isRight()) {
      targetList.addAll(result.right);
      return null;
    } else {
      return result.failure.message;
    }
  }

  void getMoreGroceries() async {
    final result = await _getGroceriesUseCase.execute(GetProductsUseCaseInput(
      skip: groceries.nextPage * 8,
    ));

    if (result.isRight()) {
      final newItems = groceries.getOnlyNewItems(result.right);
      if (newItems.isEmpty) {
        emit(GetMoreGroceriesError(AppStrings.youReachedTheEnd));
        return;
      }
      groceries.addAll(newItems);
      _currentList.addAll(newItems);
      emit(GetMoreGroceriesSuccess());
    } else {
      emit(GetMoreGroceriesError(result.failure.message));
    }
  }

  final List<ProductEntity> _currentList = [];

  List<ProductEntity> get currentList => _currentList;

  set currentList(List<ProductEntity> value) {
    _currentList.clear();
    _currentList.addAll(value);
  }
}
