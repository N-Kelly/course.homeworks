import 'package:json_annotation/json_annotation.dart';

part 'Wind.g.dart';

@JsonSerializable()
class Wind {
  final double speed;
  final double deg;

  Wind({ this.speed, this.deg });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}