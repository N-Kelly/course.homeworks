import 'package:json_annotation/json_annotation.dart';

part 'Sys.g.dart';

@JsonSerializable()
class Sys {
  final double type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({ this.type, this.id, this.country, this.sunrise, this.sunset });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
