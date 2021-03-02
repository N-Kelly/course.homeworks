import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'utils/random.dart';
import 'utils/map_extensions.dart';
import 'components/weatherItem.dart';
import 'weatherData.dart';

WeatherItem createRandomWeatherItem() {
  const List<String> allWeatherType = [WeatherTypes.CLEAR, WeatherTypes.CLOUDY, WeatherTypes.RAINY, WeatherTypes.SNOW, WeatherTypes.THUNDER_STORM];
  const List<String> allCities = ['Kharkiv', 'Kiev', 'Odesa', 'Dnipro', 'Zaporizhzhia', 'Lviv', 'Mykolaiv'];

  WeatherItem newRandomWeatherItem = WeatherItem(
      allCities.getRandom(),
      allWeatherType.getRandom(),
      randomDegree(),
      randomTime()
  );

  newRandomWeatherItem.printPretty();

  return newRandomWeatherItem;
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  WeatherItem currentItem;

  void _setRandomItem() {
    currentItem = createRandomWeatherItem();
  }

  @override
  void initState() {
    super.initState();
    _setRandomItem();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    // @TODO
                  },
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
                padding: EdgeInsets.only(bottom: 25, right: 10),
                child: FloatingActionButton(
                  onPressed: () => setState(_setRandomItem),
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