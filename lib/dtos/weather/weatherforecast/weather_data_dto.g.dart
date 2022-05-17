// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataDTO _$WeatherDataDTOFromJson(Map<String, dynamic> json) =>
    WeatherDataDTO(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      timezone: json['timezone'] as String,
      timezone_offset: json['timezone_offset'] as int,
      current: CurrentWeatherDataDTO.fromJson(
          json['current'] as Map<String, dynamic>),
      minutely: (json['minutely'] as List<dynamic>)
          .map((e) => MinutelyDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => HourlyForecastDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => DailyForecastDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataDTOToJson(WeatherDataDTO instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezone_offset,
      'current': instance.current,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
