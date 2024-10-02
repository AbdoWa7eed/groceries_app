part of 'location_cubit.dart';

sealed class LocationState {}

class LocationInitial extends LocationState {}

abstract class SelectLocationErrorStates extends LocationState {
  final String error;

  SelectLocationErrorStates(this.error);
}

class GetPositionLoading extends LocationState {}

class GetPositionSuccess extends LocationState {
  final Position position;

  GetPositionSuccess(this.position);
}

class GetPositionError extends SelectLocationErrorStates {
  GetPositionError(super.error);
}

class GetCurrentLocationLoading extends LocationState {}

class GetCurrentLocationSuccess extends LocationState {
  final PlaceDetailsEntity entity;

  GetCurrentLocationSuccess(this.entity);
}

class GetCurrentLocationError extends SelectLocationErrorStates {
  GetCurrentLocationError(super.error);
}

class GetSuggestedPlacesLoading extends LocationState {}

class GetSuggestedPlacesSuccess extends LocationState {
  final List<SuggestedPlaceEntity> entities;

  GetSuggestedPlacesSuccess(this.entities);
}

class GetSuggestedPlacesError extends LocationState {
  final String error;

  GetSuggestedPlacesError(this.error);
}

class GetPlaceDetailsLoading extends LocationState {}

class GetPlaceDetailsSuccess extends LocationState {
  final PlaceDetailsEntity entity;

  GetPlaceDetailsSuccess(this.entity);
}

class GetPlaceDetailsError extends LocationState {
  final String error;

  GetPlaceDetailsError(this.error);
}

class UpdateUserAddressError extends LocationState {
  final String error;

  UpdateUserAddressError(this.error);
}

class UpdateUserAddressLoading extends LocationState {}

class UpdateUserAddressSuccess extends LocationState {}
