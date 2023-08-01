import 'package:graviton/models/taxi.dart';
import 'package:graviton/models/taxi_type.dart';

class TaxiController {
  static Future<List<Taxi>> getTaxis() async {
    return [
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.Mini,
          id: "1",
          title: "Mini"),
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.Sedan,
          id: "2",
          title: "Sedan"),
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.SUV,
          id: "3",
          title: "SUV"),
    ];
  }
}
