import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/utils/location_helper.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';
import 'package:groceries_app/features/location/domain/usecases/get_place_details_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/get_suggested_places_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/place_from_coordinates_usecase.dart';
import 'package:groceries_app/features/location/domain/usecases/update_user_address_usecase.dart';
import 'package:uuid/uuid.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(
    this._placeFromCoordinatesUseCase,
    this._suggestedPlacesUseCase,
    this._placeDetailsUseCase,
    this._updateUserAddressUseCase,
  ) : super(LocationInitial());

  final GetPlaceFromCoordinatesUseCase _placeFromCoordinatesUseCase;
  final GetSuggestedPlacesUseCase _suggestedPlacesUseCase;
  final GetPlaceDetailsUseCase _placeDetailsUseCase;
  final UpdateUserAddressUseCase _updateUserAddressUseCase;
  late final LocationPurpose _purpose;

  void setPurpose(LocationPurpose purpose) => _purpose = purpose;

  LocationPurpose get purpose => _purpose;

  Position? _position;

  Future<void> getPosition([bool isCurrentLocation = false]) async {
    if (!isCurrentLocation) {
      emit(GetPositionLoading());
    }
    final data = await LocationHelper.getCurrentPosition();
    if (data.isRight()) {
      _position = data.right;
      if (isCurrentLocation) return;
      emit(GetPositionSuccess(data.right));
    } else {
      emit(GetPositionError(data.failure));
    }
  }

  Future<void> getCurrentLocation() async {
    emit(GetCurrentLocationLoading());
    if (_position == null) {
      await getPosition(true);
      if (_position == null) return;
    }
    final data = await _placeFromCoordinatesUseCase
        .execute('${_position!.latitude},${_position!.longitude}');
    if (data.isRight()) {
      emit(GetCurrentLocationSuccess(data.right));
    } else {
      emit(GetCurrentLocationError(data.failure.message));
    }
  }

  String? _sessionToken;

  String get sessionToken => _sessionToken ??= const Uuid().v4();

  void clearToken() => _sessionToken = null;

  Future<void> getSuggestedPlaces(String query) async {
    emit(GetSuggestedPlacesLoading());
    final data = await _suggestedPlacesUseCase.execute(
        SuggestedPlacesUseCaseInput(place: query, sessionToken: sessionToken));

    if (data.isRight()) {
      emit(GetSuggestedPlacesSuccess(data.right));
    } else {
      emit(GetSuggestedPlacesError(data.failure.message));
    }
  }

  Future<void> getPlaceDetails(String placeId) async {
    emit(GetPlaceDetailsLoading());
    final data = await _placeDetailsUseCase.execute(
        PlaceDetailsUseCaseInput(placeId: placeId, sessionToken: sessionToken));

    if (data.isRight()) {
      clearToken();
      emit(GetPlaceDetailsSuccess(data.right));
    } else {
      emit(GetPlaceDetailsError(data.failure.message));
    }
  }

  Future<void> updateUserAddress(String address) async {
    emit(UpdateUserAddressLoading());
    final data = await _updateUserAddressUseCase.execute(address);

    if (data.isRight()) {
      emit(UpdateUserAddressSuccess());
    } else {
      emit(UpdateUserAddressError(data.failure.message));
    }
  }
}
