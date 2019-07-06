import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
String errorMessage = 'Getting your location...';

void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.latitute);
  print(location.longitude);
}

void getData() async{
  Response respose = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override 
  void initState(){
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage)
      )
    );
  }
}