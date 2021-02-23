import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'weatherData.dart';
import 'utils/map_extensions.dart';
import 'utils/random.dart';

Map<String, String> createRandomWeatherItem() {
  const List<String> allWeatherType = [WeatherTypes.CLEAR, WeatherTypes.CLOUDY, WeatherTypes.RAINY, WeatherTypes.SNOW, WeatherTypes.THUNDER_STORM];
  const List<String> allCities = ['Kharkiv', 'Kiev', 'Odesa', 'Dnipro', 'Zaporizhzhia', 'Lviv', 'Mykolaiv'];

  return {
    "city": allCities.getRandom(),
    "weatherType": allWeatherType.getRandom(),
    "degree": randomDegree(),
    "time": randomTime()
  };
}

void main() {
  Map<String, String> options = createRandomWeatherItem();
  runApp(MyApp(options["city"], options["weatherType"], options["degree"], options["time"]));
}

class MyApp extends StatefulWidget {
  final String _city;
  final String _weatherType;
  final String _degree;
  final String _time;

  MyApp(this._city, this._weatherType, this._degree, this._time);

  @override
  MyAppState createState() => MyAppState(this._city, this._weatherType, this._degree, this._time);
}

class MyAppState extends State<MyApp> {
  String city;
  String weatherType;
  String degree;
  String time;

  MyAppState(this.city, this.weatherType, this.degree, this.time);

  void changeWeatherItem() {
    setState(() {
      Map<String, String> options = createRandomWeatherItem();
      city = options["city"];
      weatherType = options["weatherType"];
      degree = options["degree"];
      time = options["time"];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );

    return MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
            fontFamily: 'RedHatDisplayRegular',
            primaryColor: Color(0xFF40C4FF),
            appBarTheme: AppBarTheme(
                color: Color(0xFF40C4FF)
            )
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                  'Flutter Weather',
                  style: TextStyle(color: Color(0xffffffff))
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: 'Show settings',
                  onPressed: () {},
                )
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF40C4FF),
                      const Color(0xFF9AE0FF)
                    ]
                ),
              ),
              child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 60, bottom: 25),
                        child:  Image.asset('assets/images/weather_types/$weatherType.png', scale: 0.8)
                    ),
                    Text(
                        '$city',
                        style: TextStyle(fontFamily: 'RedHatDisplayRegular', fontSize: 42)
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                          '$degree ℃',
                          style: TextStyle(fontFamily: 'RedHatDisplayMedium', fontSize: 42)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                          'Last Updated at $time',
                          style: TextStyle(fontFamily: 'RedHatDisplayRegular', fontSize: 16)
                      ),
                    )
                  ]
              ),
              constraints: BoxConstraints.expand(),
            ),
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 25, right: 10),
                child: FloatingActionButton(
                  onPressed: changeWeatherItem,
                  tooltip: 'Increment',
                  child: Text(
                      '?',
                      style: TextStyle(fontFamily: 'RedHatDisplayMedium', fontSize: 24)
                  ),
                )
            )
        )
    );
  }
}