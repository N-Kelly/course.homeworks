import 'package:json_annotation/json_annotation.dart';

import 'Coord.dart';
import 'Weather.dart';
import 'Main.dart';
import 'Wind.dart';
import 'Clouds.dart';
import 'Sys.dart';
part 'WeatherCity.g.dart';

@JsonSerializable()
class WeatherCity {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherCity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod
  });

  factory WeatherCity.fromJson(Map<String, dynamic> json) => _$WeatherCityFromJson(json);
}