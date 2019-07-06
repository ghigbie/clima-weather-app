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
  NetworkHelper
}

void getData() async{
  String baseURL = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kAPIKey';
  http.Response response = await http.get(baseURL);
  if(response.statusCode == 200){
    String data = response.body;
    var decodedData =jsonDecode(data);
  }else{
    print('Something went wrong: ');
    print(response.statusCode);
  }
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