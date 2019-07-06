import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:RaisedButton(
          onPressed: () {

          },
        child: Text('Get Location'),
        )
      )
    );
  }
}