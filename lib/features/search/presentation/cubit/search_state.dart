part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class GetInitialProductsLoading extends SearchState {}

class GetInitialProductsSuccess extends SearchState {}

class GetInitialProductsError extends SearchState {
  final String error;
  GetInitialProductsError(this.error);
}


class GetMoreProductsSuccess extends SearchState {}

class GetMoreProductsError extends SearchState {
  final String error;
  GetMoreProductsError(this.error);
}

