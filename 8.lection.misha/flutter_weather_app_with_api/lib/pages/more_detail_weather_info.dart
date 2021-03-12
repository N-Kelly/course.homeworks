import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../utils/get_user_location.dart';
import '../components/weather_item.dart';
import '../constants.dart';
import '../models/WeatherCity/WeatherCity.dart';
import '../providers/WeatherCity.dart';
import '../components/loader.dart';

class MoreDetailWeatherInCity extends StatefulWidget {
  MoreDetailWeatherInCity({Key key}) : super(key: key);

  @override
  _MoreDetailWeatherInCityState createState() =>
      _MoreDetailWeatherInCityState();
}

class _MoreDetailWeatherInCityState extends State<MoreDetailWeatherInCity> {
  @override
  Widget build(BuildContext context) {
    final String cityName = context.watch<WeatherCityModel>().cityName;
    final bool isMyOwnCity = cityName == 'myOwnPosition';

    return MaterialApp(
      title: '${isMyOwnCity ? 'My own city' : cityName}',
      theme: ThemeData(
        fontFamily: 'RedHatDisplayRegular',
        primaryColor: Color(0xFF40C4FF),
        appBarTheme: AppBarTheme(
          color: Color(0xFF40C4FF),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              '${isMyOwnCity ? 'My own city' : cityName}',
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFFFFFFF),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF40C4FF), Color(0xFF9AE0FF)]),
          ),
          child: FutureBuilder(
            future: getWeatherByCity(isMyOwnCity, context, cityName: cityName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  final WeatherCity data = snapshot.data;

                  final String iconType = data.weather[0].main;
                  final double degree = data.main.temp;
                  final int date = data.dt;

                  return WeatherItem(iconType, degree, date);
                }
              }

              if (snapshot.hasError) {
                return Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Icon(
                      Icons.new_releases_outlined,
                      size: 80,
                    ),
                    Text(
                      'Something went wrong :(',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                );
              }

              return Loader();
            },
          ),
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }

  Future getWeatherByCity(isOwnCity, context, {cityName}) async {
    await Future.delayed(Duration(seconds: 2));

    Map userLocationData;
    if (isOwnCity) {
      userLocationData = await getUserLocation();
      if (userLocationData == null) {
        Navigator.of(context).pop();
        return null;
      }
    }

    var response = await http.get(isOwnCity
        ? "http://api.openweathermap.org/data/2.5/weather?lat=${userLocationData['lat']}&lon=${userLocationData['long']}&appid=${App.API_KEY}"
        : 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${App.API_KEY}');

    return WeatherCity.fromJson(jsonDecode(response.body));
  }
}
