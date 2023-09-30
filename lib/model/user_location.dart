// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
 
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
  });

}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate({required this.latitude, required this.longitude});

}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});

}
