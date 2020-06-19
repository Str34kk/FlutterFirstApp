import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataAboutWeatherFromLoadingPage = {};

  @override
  Widget build(BuildContext context) {

    dataAboutWeatherFromLoadingPage = dataAboutWeatherFromLoadingPage.isNotEmpty ? dataAboutWeatherFromLoadingPage : ModalRoute.of(context).settings.arguments;
    
    String urlForDayOrNightChoice = dataAboutWeatherFromLoadingPage['isDayOrNight'] ? 'day.png' : 'night.png';
    Color colorForDayOrNightChoice = dataAboutWeatherFromLoadingPage['isDayOrNight'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: colorForDayOrNightChoice,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$urlForDayOrNightChoice'),
              fit: BoxFit.cover,  
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/Location');
                    setState(() {
                      dataAboutWeatherFromLoadingPage = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayOrNight': result['isDayOrNight'],
                    };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'edit location',
                    style: TextStyle(
                    color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      dataAboutWeatherFromLoadingPage['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  dataAboutWeatherFromLoadingPage['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}