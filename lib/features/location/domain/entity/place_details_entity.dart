class PlaceDetailsEntity {
  final String placeId;
  final String address;
  final LocationEntity location;

  PlaceDetailsEntity(
      {required this.placeId, required this.address, required this.location});
}

class LocationEntity {
  final double latitude;
  final double longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });
}
