// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastDataDTO _$HourlyForecastDataDTOFromJson(
        Map<String, dynamic> json) =>
    HourlyForecastDataDTO(
      dt: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dew_point'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      clouds: json['clouds'] as int,
      visibility: json['visibility'] as int,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      windDeg: json['wind_deg'] as int,
      rain: (json['rain'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      snow: (json['snow'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyForecastDataDTOToJson(
        HourlyForecastDataDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_gust': instance.windGust,
      'wind_deg': instance.windDeg,
      'rain': instance.rain,
      'snow': instance.snow,
      'weather': instance.weather,
    };
