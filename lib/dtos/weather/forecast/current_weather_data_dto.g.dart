// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDataDTO _$CurrentWeatherDataDTOFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherDataDTO(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
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
      windGeg: json['wind_deg'] as int,
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

Map<String, dynamic> _$CurrentWeatherDataDTOToJson(
        CurrentWeatherDataDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
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
      'wind_deg': instance.windGeg,
      'rain': instance.rain,
      'snow': instance.snow,
      'weather': instance.weather,
    };
