import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/utilities/hidden_constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
String errorMessage = 'Getting your location...';
double latitude;
double longitude;

void getLocationData() async {
  Location location = Location();
  await location.getCurrentLocation();
  latitude = location.latitute;
  longitude = location.longitude;
  NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kAPIKey');
  var weatherData = await networkHelper.getData();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override 
  void initState(){
    super.initState();
    getLocationData(); //calling the function
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