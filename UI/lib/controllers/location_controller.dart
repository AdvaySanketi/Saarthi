import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graviton/models/google_location.dart';

class LocationController {
  static Future<GoogleLocation> getCurrentLocation() async {
    return GoogleLocation("ChIJN1t_tDeuEmsRUsoyG83frY4",
        LatLng(40.7829, -73.9654), "Electronic City, Bangalore, India");
  }

  static Future<GoogleLocation> getLocationfromId(LatLng position) async {
    return GoogleLocation("ChIJN1t_tDeuEmsRUsoyG83frY4",
        LatLng(40.747092, -73.987013), "Ring Road, Bangalore, India");
  }

  static Future<List<LatLng>> getPolylines(LatLng start, LatLng end) async {
    List<Map> map = [
      {"lat": 40.7835246, "lng": -73.9651392},
      {"lat": 40.74700869999999, "lng": -73.9870749},
      {"lat": 40.7836479, "lng": -73.96495809999999},
      {"lat": 40.78148909999999, "lng": -73.9627453},
      {"lat": 40.7802148, "lng": -73.9613768},
      {"lat": 40.74653929999999, "lng": -73.9859729},
      {"lat": 40.74700869999999, "lng": -73.9870749}
    ];
    return map.map((val) => LatLng(val["lat"], val["lng"])).toList();
  }
}
