import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';

class GetPlaceDetailsUseCase
    extends BaseUseCase<PlaceDetailsUseCaseInput, PlaceDetailsEntity> {
  final LocationRepository _locationRepository;

  GetPlaceDetailsUseCase(this._locationRepository);

  @override
  ResultFuture<PlaceDetailsEntity> execute(PlaceDetailsUseCaseInput input) {
    return _locationRepository.getPlaceDetails(input);
  }
}

class PlaceDetailsUseCaseInput extends PlaceDetailsRequestParams {
  PlaceDetailsUseCaseInput(
      {required super.placeId, required super.sessionToken});
}
