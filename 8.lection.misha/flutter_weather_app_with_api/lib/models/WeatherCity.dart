import 'package:json_annotation/json_annotation.dart';

part 'WeatherCity.g.dart';

@JsonSerializable()
class WeatherCity {
  final String iconType;
  final double degree;
  final int date;

  WeatherCity({ this.iconType, this.degree, this.date });

  factory WeatherCity.fromJson(Map<String, dynamic> json) => _$WeatherCityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCityToJson(this);
}