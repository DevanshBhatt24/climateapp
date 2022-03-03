import 'package:geolocator/geolocator.dart';

class getloaction {
  double? lat;
  double? lon;
  Future<void> currgetlocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
