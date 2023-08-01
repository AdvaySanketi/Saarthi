import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graviton/models/user_location.dart';
import 'package:location/location.dart';

class UserLocationController {
  static Future<LatLng> getCurrentLocation() async {
    Location location = Location();
    PermissionStatus check = await location.hasPermission();
    if (check == PermissionStatus.denied) {
      check = await location.requestPermission();
      if (check == PermissionStatus.granted) {
        LocationData position = await location.getLocation();
        return LatLng(position.latitude, position.longitude);
      }
    }
    return null;
  }

  static Future<List<UserLocation>> getSavedLocations() async {
    return [
      UserLocation.named(
          name: "Petrol",
          locationType: UserLocationType.Voucher,
          position: LatLng(0, 0),
          minutesFar: 10),
      UserLocation.named(
          name: "Parking",
          locationType: UserLocationType.Voucher,
          position: LatLng(0, 0),
          minutesFar: 100),
    ];
  }
}
