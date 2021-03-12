import 'package:json_annotation/json_annotation.dart';

part 'Clouds.g.dart';

@JsonSerializable()
class Clouds {
  final double all;

  Clouds({ this.all });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}