import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDTO {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDTO(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}
