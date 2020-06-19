import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  
  String location;
  String time;
  String flag;
  String url;
  bool isDayOrNight;

  WorldTime({this.location, this.flag, this.url});

  Future<void> gettingDataFromWeatherAPI() async {
    Response jsonResponseFromWeatherAPI = await get('http://worldtimeapi.org/api/timezone/$url');
    Map dataFromWeatherAPI = jsonDecode(jsonResponseFromWeatherAPI.body);
    
    String timeFromWetherAPI = dataFromWeatherAPI['datetime'];
    String offSetFromWeatherApi = dataFromWeatherAPI['utc_offset'].substring(0,3);

    DateTime currentDateTimeFromWeatherApi = DateTime.parse(timeFromWetherAPI);
    currentDateTimeFromWeatherApi = currentDateTimeFromWeatherApi.add(Duration(hours: int.parse(offSetFromWeatherApi)));

    isDayOrNight = currentDateTimeFromWeatherApi.hour > 6 && currentDateTimeFromWeatherApi.hour < 20 ? true : false;
    time = DateFormat.jm().format(currentDateTimeFromWeatherApi);
  }
  
}