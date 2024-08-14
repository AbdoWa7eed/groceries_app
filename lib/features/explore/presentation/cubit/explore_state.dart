part of 'explore_cubit.dart';

class ExploreState {}

final class ExploreInitial extends ExploreState {}


final class GetCategoriesLoading extends ExploreState {}

final class GetCategoriesSuccess extends ExploreState {}

final class GetCategoriesError extends ExploreState {
  final String error;
  GetCategoriesError(this.error);
}


final class GetCategoryProductsLoading extends ExploreState {}

final class GetCategoryProductsSuccess extends ExploreState {}

final class GetCategoryProductsError extends ExploreState {
  final String error;
  GetCategoryProductsError(this.error);
}


