import 'package:flutter/material.dart';

class WeatherCityModel extends ChangeNotifier {
  String cityName;
  String get currentCityName => cityName;

  void changeCityName(String city) {
    cityName = city;
    notifyListeners();
  }
}
