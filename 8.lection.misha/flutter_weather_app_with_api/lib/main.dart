import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'providers/WeatherCity.dart';
import 'pages/homepage.dart';
import 'pages/more_detail_weather_info.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherCityModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (_) => Homepage(),
          '/more-detail-weather': (_) => MoreDetailWeatherInCity(),
        },
      ),
    ),
  );
}
