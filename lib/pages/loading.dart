import 'package:flutter/material.dart';
import 'package:sample/services/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Warsaw', flag: 'warsaw.png', url: 'Europe/Warsaw');
    await instance.gettingDataFromWeatherAPI();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayOrNight': instance.isDayOrNight,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
        ),
      ),
    );
  }
}