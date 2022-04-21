import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String name;
  final Map<String, String>? local_names;
  final double lat;
  final double lon;
  final String country;
  final String state;

  City({
    required this.name,
    this.local_names,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
