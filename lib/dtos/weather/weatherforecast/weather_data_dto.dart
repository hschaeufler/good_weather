import 'package:good_weather/dtos/weather/weatherforecast/current_weather_data_dto.dart';
import 'package:good_weather/dtos/weather/weatherforecast/daily_forecast_data_dto.dart';
import 'package:good_weather/dtos/weather/weatherforecast/hourly_forecast_data_dto.dart';
import 'package:good_weather/dtos/weather/weatherforecast/minutely_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data_dto.g.dart';

@JsonSerializable()
class WeatherDataDTO {
  final double lon;
  final double lat;
  final String timezone;
  final int timezone_offset;
  final CurrentWeatherDataDTO current;
  final List<MinutelyDTO> minutely;
  final List<HourlyForecastDataDTO> hourly;
  final List<DailyForecastDataDTO> daily;

  WeatherDataDTO(
      {required this.lon,
      required this.lat,
      required this.timezone,
      required this.timezone_offset,
      required this.current,
      required this.minutely,
      required this.hourly,
      required this.daily});

  factory WeatherDataDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataDTOToJson(this);
}
