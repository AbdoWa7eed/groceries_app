import 'package:bloc/bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_banners_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_best_selling_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_exclusive_offers_usecase.dart';
import 'package:groceries_app/features/shop/domain/usecases/get_groceries_usecase.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this._getBestSellingUseCase, this._getExclusiveOffersUseCase,
      this._getGroceriesUseCase, this._getBannersUseCase)
      : super(ShopInitial());

  final GetBestSellingUseCase _getBestSellingUseCase;
  final GetExclusiveOffersUseCase _getExclusiveOffersUseCase;
  final GetGroceriesUseCase _getGroceriesUseCase;
  final GetBannersUseCase _getBannersUseCase;

  final List<ProductEntity> _bestSelling = [];
  final List<ProductEntity> _exclusiveOffers = [];
  final List<ProductEntity> _groceries = [];
  final List<BannerEntity> _banners = [];

  List<ProductEntity> get bestSelling => _bestSelling;
  List<ProductEntity> get exclusiveOffers => _exclusiveOffers;
  List<ProductEntity> get groceries => _groceries;
  List<BannerEntity> get banners => _banners;

  bool get _isInitLoading => state is ShopLoading;
  bool get _isInitError => state is ShopError;
  Future<void> initShopData() async {
    emit(ShopLoading());
    await getBanners();
    if (_isInitError) return;
    await getBestSelling();
    if (_isInitError) return;
    await getExclusiveOffers();
    if (_isInitError) return;
    await getGroceries();
    emit(ShopSuccess());
  }

  Future<void> getBestSelling() async {
    emit(_isInitLoading ? state : GetBestSellingLoading());
    final result = await _getBestSellingUseCase.execute();
    if (result.isRight()) {
      _bestSelling.addAll(result.right);
      emit(_isInitLoading ? state : GetBestSellingSuccess());
    } else {
      emit(_isInitLoading
          ? ShopError(result.failure.message)
          : GetBestSellingError(result.failure.message));
    }
  }

  Future<void> getExclusiveOffers() async {
    emit(_isInitLoading ? state : GetExclusiveOffersLoading());
    final result = await _getExclusiveOffersUseCase.execute();
    if (result.isRight()) {
      _exclusiveOffers.addAll(result.right);
      emit(_isInitLoading ? state : GetExclusiveOffersSuccess());
    } else {
      emit(_isInitLoading
          ? ShopError(result.failure.message)
          : GetExclusiveOffersError(result.failure.message));
    }
  }

  Future<void> getGroceries({
    int page = 0,
  }) async {
    emit(_isInitLoading ? state : GetGroceriesLoading());
    final result = await _getGroceriesUseCase
        .execute(GetGroceriesUsecaseInput(skip: page * 8));
    if (result.isRight()) {
      final newProducts = _getNewProducts(_groceries, result.right);
      if (newProducts.isEmpty && !_isInitLoading) {
        emit(GetGroceriesError(AppStrings.youReachedTheEnd));
        return;
      }
      _groceries.addAll(newProducts);
      if (page != 0) {
        currentList.clear();
        currentList.addAll(_groceries);
      }
      emit(_isInitLoading ? state : GetGroceriesSuccess());
    } else {
      emit(_isInitLoading
          ? ShopError(result.failure.message)
          : GetGroceriesError(result.failure.message));
    }
  }

  _getNewProducts(
      List<ProductEntity> oldList, List<ProductEntity> newProudcts) {
    final existingProductsSet = Set<ProductEntity>.from(oldList);
    return newProudcts
        .where((product) => !existingProductsSet.contains(product))
        .toList();
  }

  Future<void> getBanners() async {
    emit(_isInitLoading ? state : GetBannersLoading());
    final result = await _getBannersUseCase.execute();
    if (result.isRight()) {
      _banners.addAll(result.right);
      emit(_isInitLoading ? state : GetBannersSuccess());
    } else {
      emit(_isInitLoading
          ? ShopError(result.failure.message)
          : GetBannersError(result.failure.message));
    }
  }

  final List<ProductEntity> _currentList = [];

  List<ProductEntity> get currentList => _currentList;

  set currentList(List<ProductEntity> value) {
    _currentList.clear();
    _currentList.addAll(value);
  }
}
