import 'package:geolocator/geolocator.dart';

class Location {
   double latitude;
   double longitude;
   String errorMessage;

   Future<void> getCurrentLocation() async{
     try{
       Position position  = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
       latitude = position.latitude;
       longitude = position.longitude;
     }catch(e){
       print('Exception: $e');
       errorMessage = 'Sorry, your location could not be determined. Please try again later.';
     }
   }

}