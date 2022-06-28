import 'package:good_weather/dtos/weather/forecast/alert_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current_weather_data_dto.dart';
import 'daily_forecast_data_dto.dart';
import 'hourly_forecast_data_dto.dart';
import 'minutely_dto.dart';

part 'one_call_weather_data_dto.g.dart';

@JsonSerializable()
class OneCallWeatherDataDTO {
  final double lon;
  final double lat;
  final String timezone;
  final int timezone_offset;
  final CurrentWeatherDataDTO current;
  final List<MinutelyDTO>? minutely;
  final List<HourlyForecastDataDTO> hourly;
  final List<DailyForecastDataDTO> daily;
  final List<AlertDTO>? alerts;

  OneCallWeatherDataDTO(
      {required this.lon,
      required this.lat,
      required this.timezone,
      required this.timezone_offset,
      required this.current,
      required this.minutely,
      required this.hourly,
      required this.daily,
      this.alerts});

  factory OneCallWeatherDataDTO.fromJson(Map<String, dynamic> json) =>
      _$OneCallWeatherDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OneCallWeatherDataDTOToJson(this);
}
