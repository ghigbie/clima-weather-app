import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/hidden_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String errorMessage = 'Getting your location...';
  double latitude;
  double longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitute}&lon=${location.longitude}&appid=$kAPIKey');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }
    ));
  }

  @override 
  void initState(){
    super.initState();
    getLocationData(); //calling the function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}