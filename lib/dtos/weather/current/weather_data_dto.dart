import 'package:json_annotation/json_annotation.dart';

import 'cloud_dto.dart';
import 'coordinates_dto.dart';
import 'system_dto.dart';
import 'temperature_dto.dart';
import 'weather_dto.dart';
import 'wind_dto.dart';

part 'weather_data_dto.g.dart';

@JsonSerializable()
class WeatherDataDTO {
  final CoordinatesDTO coord;
  final List<WeatherDTO> weather;
  final String base;
  final TemperatureDTO main;
  final int visibility;
  final WindDTO wind;
  final CloudDTO clouds;
  final int dt;
  final SystemDTO sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherDataDTO(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory WeatherDataDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataDTOToJson(this);
}
