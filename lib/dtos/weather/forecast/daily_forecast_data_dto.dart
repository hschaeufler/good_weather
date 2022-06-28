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
  @JsonKey(name: "moonset")
  final int moonSet;
  @JsonKey(name: "moon_phase")
  final double moonPhase;
  final TemperatureDTO temp;
  @JsonKey(name: "feels_like")
  final FeelsLikeDTO feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: "dew_point")
  final double dewPoint;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "wind_deg")
  final int windDeg;
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
      required this.moonSet,
      required this.moonPhase,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.windSpeed,
      required this.windDeg,
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
