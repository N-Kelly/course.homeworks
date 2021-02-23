import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'components/Home/weather_item.dart';
import 'weatherData.dart';
import 'utils/map_extensions.dart';
import 'utils/random.dart';

WeatherItem createRandomWeatherItem() {
  const List<String> allWeatherType = [WeatherTypes.CLEAR, WeatherTypes.CLOUDY, WeatherTypes.RAINY, WeatherTypes.SNOW, WeatherTypes.THUNDER_STORM];
  const List<String> allCities = ['Kharkiv', 'Kiev', 'Odesa', 'Dnipro', 'Zaporizhzhia', 'Lviv', 'Mykolaiv'];

  print("${allCities.getRandom()}");

  return WeatherItem(
      allCities.getRandom(),
      allWeatherType.getRandom(),
      randomDegree(),
      randomTime()
  );
}

void main() {
  runApp(MyApp(createRandomWeatherItem()));
}

class MyApp extends StatefulWidget {
  final WeatherItem _currentItem;

  MyApp(this._currentItem);

  @override
  MyAppState createState() => MyAppState(_currentItem);
}

class MyAppState extends State<MyApp> {
  WeatherItem currentItem;

  MyAppState(this.currentItem);

  void changeWeatherItem() {
    setState(() {
      currentItem = createRandomWeatherItem();
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
              child: currentItem,
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