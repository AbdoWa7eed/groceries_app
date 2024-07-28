import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/location/domain/repo/location_repo.dart';

class UpdateUserAddressUseCase extends BaseUseCase<String, void> {
  final LocationRepository _locationRepository;

  UpdateUserAddressUseCase(this._locationRepository);

  @override
  ResultFuture<void> execute(String input) {
    return _locationRepository.updateUserAddress(input);
  }
}
