import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../utils/get_user_location.dart';
import '../components/weather_item.dart';
import '../constants.dart';
import '../models/WeatherCity.dart';
import '../providers/WeatherCity.dart';

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
          child: isMyOwnCity ? getWeatherInMyOwnCityBuilder(context) : getWeatherByCityNameBuilder(cityName),
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }

  FutureBuilder getWeatherInMyOwnCityBuilder(context) {
    return FutureBuilder(
      future: getWeatherInMyOwnCityRequest(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data != null) {
            final String iconType = snapshot.data.iconType;
            final double degree = snapshot.data.degree;
            final int date = snapshot.data.date;

            return WeatherItem(iconType, degree, date);
          } else {
            return Container();
          }
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Transform.scale(
                scale: 2.5,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF141C22),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future getWeatherInMyOwnCityRequest(context) async {
    await Future.delayed(Duration(seconds: 2));

    Map userLocationData = await getUserLocation();

    if(userLocationData != null) {
      var response = await http.get("http://api.openweathermap.org/data/2.5/weather?lat=${userLocationData['lat']}&lon=${userLocationData['long']}&appid=${App.API_KEY}");
      Map responseObject = jsonDecode(response.body);

      return WeatherCity.fromJson({
        'iconType': responseObject['weather'][0]['main'],
        'date': responseObject['dt'],
        'degree': responseObject['main']['temp']
      });
    } else {
      Navigator.of(context).pop();
      return null;
    }
  }

  FutureBuilder getWeatherByCityNameBuilder(cityName) {
    return FutureBuilder(
      future: getWeatherByCityNameRequest(cityName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final String iconType = snapshot.data.iconType;
          final double degree = snapshot.data.degree;
          final int date = snapshot.data.date;

          return WeatherItem(iconType, degree, date);
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Transform.scale(
                scale: 2.5,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF141C22),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<WeatherCity> getWeatherByCityNameRequest(cityName) async {
    await Future.delayed(Duration(seconds: 2));

    var response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${App.API_KEY}');
    Map responseObject = jsonDecode(response.body);

    return WeatherCity.fromJson({
      'iconType': responseObject['weather'][0]['main'],
      'date': responseObject['dt'],
      'degree': responseObject['main']['temp']
    });
  }
}
