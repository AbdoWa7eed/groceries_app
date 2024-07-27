import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';

class GetPlaceFromCoordinatesUseCase
    extends BaseUseCase<String, PlaceDetailsEntity> {
  final LocationRepository _locationRepository;

  GetPlaceFromCoordinatesUseCase(this._locationRepository);

  @override
  ResultFuture<PlaceDetailsEntity> execute(String input) {
    return _locationRepository
        .getPlaceFromCoordinates(PlaceGeocodeRequestParams(latlng: input));
  }
}
