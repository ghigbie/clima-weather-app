import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
String errorMessage = 'Getting your location...';

void getLocation() async {
  try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('Position: $position');
    errorMessage = 'Your location is: $position';
  }catch(e){
    print('Eexception: $e');
    errorMessage = 'Sorry. You\'r location cannot be determined right now...';
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