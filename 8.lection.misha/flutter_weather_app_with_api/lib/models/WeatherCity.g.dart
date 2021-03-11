// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherCity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCity _$WeatherCityFromJson(Map<String, dynamic> json) {
  return WeatherCity(
    iconType: json['iconType'] as String,
    degree: json['degree'] as double,
    date: json['date'] as int,
  );
}

Map<String, dynamic> _$WeatherCityToJson(WeatherCity instance) =>
    <String, dynamic>{
      'iconType': instance.iconType,
      'degree': instance.degree,
      'date': instance.date,
    };
