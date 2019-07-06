import 'package:geolocator/geolocator.dart';

class Location {

  double latitute;
  double longitude;
  String errorMessage;


   Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitute =position.latitude;
      longitude = position.longitude;
    }catch(e){
      print('Eception $e');
      errorMessage = 'Sorry. Your location could not be dertermined';
    }
 }
}