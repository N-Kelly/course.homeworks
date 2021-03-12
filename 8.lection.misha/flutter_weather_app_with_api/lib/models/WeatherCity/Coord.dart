import 'package:json_annotation/json_annotation.dart';

part 'Coord.g.dart';

@JsonSerializable()
class Coord {
  final double lon;
  final double lat;

  Coord({ this.lon, this.lat });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}