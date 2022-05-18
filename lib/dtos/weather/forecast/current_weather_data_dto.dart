import 'package:json_annotation/json_annotation.dart';

import 'weather_dto.dart';

part 'current_weather_data_dto.g.dart';

@JsonSerializable()
class CurrentWeatherDataDTO {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feels_like;
  final int pressure;
  final int humidity;
  final double dew_point;
  final double uvi;
  final int clouds;
  final int visibility;
  final double wind_speed;
  final double? wind_gust;
  final int wind_deg;
  final Map<String, double>? rain;
  final Map<String, double>? snow;
  final List<WeatherDTO> weather;

  CurrentWeatherDataDTO(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.dew_point,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.wind_speed,
      this.wind_gust,
      required this.wind_deg,
      this.rain,
      this.snow,
      required this.weather});

  factory CurrentWeatherDataDTO.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherDataDTOToJson(this);
}
