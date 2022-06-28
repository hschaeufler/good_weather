import 'package:json_annotation/json_annotation.dart';

import 'feels_like_dto.dart';
import 'temperature_dto.dart';
import 'weather_dto.dart';

part 'daily_forecast_data_dto.g.dart';

@JsonSerializable()
class DailyForecastDataDTO {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moon_phase;
  final TemperatureDTO temp;
  final FeelsLikeDTO feels_like;
  final int pressure;
  final int humidity;
  final double dew_point;
  final double wind_speed;
  final int wind_deg;
  final List<WeatherDTO> weather;
  final int clouds;
  final double pop;
  final double? rain;
  final double? snow;
  final double uvi;

  DailyForecastDataDTO(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moon_phase,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.dew_point,
      required this.wind_speed,
      required this.wind_deg,
      required this.weather,
      required this.clouds,
      required this.pop,
      required this.uvi,
        this.rain,
        this.snow});

  factory DailyForecastDataDTO.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$DailyForecastDataDTOToJson(this);
}
