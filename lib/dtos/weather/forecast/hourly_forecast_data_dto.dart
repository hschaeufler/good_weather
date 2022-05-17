import 'package:json_annotation/json_annotation.dart';

import 'weather_dto.dart';

part 'hourly_forecast_data_dto.g.dart';

@JsonSerializable()
class HourlyForecastDataDTO {
  final int dt;
  final double temp;
  final double feels_like;
  final int pressure;
  final int humidity;
  final double dew_point;
  final double uvi;
  final int clouds;
  final int visibility;
  final double wind_speed;
  final double wind_gust;
  final int wind_deg;
  final Map<String, double>? rain;
  final Map<String, double>? snow;
  final List<WeatherDTO> weather;

  HourlyForecastDataDTO(
  {required this.dt,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.dew_point,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.wind_speed,
      required this.wind_gust,
      required this.wind_deg,
      this.rain,
      this.snow,
      required this.weather});

  factory HourlyForecastDataDTO.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyForecastDataDTOToJson(this);
}
