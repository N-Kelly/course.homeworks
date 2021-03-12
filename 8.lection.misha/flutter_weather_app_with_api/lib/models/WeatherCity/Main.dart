import 'package:json_annotation/json_annotation.dart';

part 'Main.g.dart';

@JsonSerializable()
class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final double pressure;
  final int humidity;

  Main({ this.temp, this.feels_like, this.temp_min, this.temp_max, this.pressure, this.humidity });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}