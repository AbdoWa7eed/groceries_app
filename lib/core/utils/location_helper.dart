import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationHelper {
  static bool _isPermissionGranted(LocationPermission permission) {
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  static Future<Either<String, Position>> getCurrentPosition() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();
    if (!isServiceEnabled || !_isPermissionGranted(permission)) {
      await Geolocator.requestPermission();
    }

    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Right(position);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
