import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/location/data/data_source/location_data_source.dart';
import 'package:groceries_app/features/location/data/mapper/place_details_mapper.dart';
import 'package:groceries_app/features/location/data/mapper/suggested_place_mapper.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDataSource _locationDataSource;

  LocationRepositoryImpl(this._locationDataSource);

  @override
  ResultFuture<List<SuggestedPlaceEntity>> getSuggestedPlaces(
      SuggestedPlaceRequestParams suggestedPlacesRequest) async {
    try {
      final result =
          await _locationDataSource.getSuggestedPlaces(suggestedPlacesRequest);

      if (result.predictions == null) {
        return Left(Failure.apiInternalError(result.status));
      }

      return Right(result.predictions!.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<PlaceDetailsEntity> getPlaceDetails(
      PlaceDetailsRequestParams placeDetailsRequest) async {
    try {
      final result =
          await _locationDataSource.getPlaceDetails(placeDetailsRequest);

      if (result.placeDetails == null) {
        return Left(Failure.apiInternalError(result.status));
      }

      return Right(result.placeDetails!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<PlaceDetailsEntity> getPlaceFromCoordinates(
      PlaceGeocodeRequestParams placeGeocodeRequest) async {
    try {
      final result =
          await _locationDataSource.getPlaceFromLatLng(placeGeocodeRequest);
      if (result.places == null || result.places!.isEmpty) {
        return Left(Failure.apiInternalError(result.status));
      }

      return Right(result.places!
          .firstWhere((e) => e.address.isFormattedAddress)
          .toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<void> updateUserAddress(String address) async {
    try {
      return Right(await _locationDataSource.updateUserAddress(address));
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
