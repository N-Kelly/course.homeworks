import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'utils/random.dart';

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
  String city;
  String weatherType;
  String degree;
  String time;

  void _setRandomItem() {
    Map<String, String> options = createRandomWeatherItem();
    city = options["city"];
    weatherType = options["weatherType"];
    degree = options["degree"];
    time = options["time"];
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
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Image.asset('assets/images/weather_types/$weatherType.png', scale: 0.8),
                    SizedBox(height: 25),
                    Text(
                        '$city',
                        style: TextStyle(fontSize: 42)
                    ),
                    SizedBox(height: 10),
                    Text(
                        '$degree ℃',
                        style: TextStyle(fontFamily: 'RedHatDisplayMedium', fontSize: 42)
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Last Updated at $time',
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
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