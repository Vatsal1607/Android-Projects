import 'package:clima_2/screens/location_screen.dart';
import 'package:clima_2/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {

    var weatherData = WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          // arrow function will give here ERROR :)
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
    // print('temp is here: $temperature');
    // print('cityName is here: $cityName');
    // print('Condition is here: $condition');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
        ),
      ),
    );
  }
}
