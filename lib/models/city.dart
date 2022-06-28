import 'package:json_annotation/json_annotation.dart';

class City {
  final int? id;
  final String name;
  @JsonKey(name: "local_names")
  final Map<String, String>? localNames;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  City(
      {this.id,
      required this.name,
      this.localNames,
      required this.lat,
      required this.lon,
      required this.country,
      this.state});
}
