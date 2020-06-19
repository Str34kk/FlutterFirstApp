import 'package:flutter/material.dart';
import 'package:sample/services/World_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

List<WorldTime> locations = [
    WorldTime(url: 'Europe/Warsaw', location: 'Warsaw', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void upDateTime(index) async {
    WorldTime instance = locations[index];
    await instance.gettingDataFromWeatherAPI();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayOrNight': instance.isDayOrNight,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal:  5.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return(Card(
              child: ListTile(
                onTap: () {
                  upDateTime(index);
                },
                title: Text(locations[index].location),
              ),
            ));
          },
        ),
      ),
    );
  }
}