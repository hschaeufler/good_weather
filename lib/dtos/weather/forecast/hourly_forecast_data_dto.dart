import 'package:json_annotation/json_annotation.dart';

import 'weather_dto.dart';

part 'hourly_forecast_data_dto.g.dart';

@JsonSerializable()
class HourlyForecastDataDTO {
  final int dt;
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: "dew_point")
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "wind_gust")
  final double? windGust;
  @JsonKey(name: "wind_deg")
  final int windDeg;
  final Map<String, double>? rain;
  final Map<String, double>? snow;
  final List<WeatherDTO> weather;

  HourlyForecastDataDTO(
  {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.windSpeed,
      this.windGust,
      required this.windDeg,
      this.rain,
      this.snow,
      required this.weather});

  factory HourlyForecastDataDTO.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyForecastDataDTOToJson(this);
}
