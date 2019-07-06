import 'package:geolocator/geolocator.dart';

class Location {

  double latitute;
  double logitude;
  String errorMessage;


   void getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitute =position.latitude;
      logitude = position.longitude;
      print(position.latitude);
      print(position.longitude);
    }catch(e){
      print('Eception $e');
      errorMessage = 'Sorry. Your location could not be dertermined';
    }
 }
}