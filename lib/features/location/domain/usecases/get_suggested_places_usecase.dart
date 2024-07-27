import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';

class GetSuggestedPlacesUseCase extends BaseUseCase<SuggestedPlacesUseCaseInput,
    List<SuggestedPlaceEntity>> {
  final LocationRepository _locationRepository;

  GetSuggestedPlacesUseCase(this._locationRepository);

  @override
  ResultFuture<List<SuggestedPlaceEntity>> execute(
      SuggestedPlacesUseCaseInput input) {
    return _locationRepository.getSuggestedPlaces(input);
  }
}

class SuggestedPlacesUseCaseInput extends SuggestedPlaceRequestParams {
  SuggestedPlacesUseCaseInput(
      {required super.place, required super.sessionToken});
}
