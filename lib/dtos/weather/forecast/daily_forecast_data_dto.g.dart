// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastDataDTO _$DailyForecastDataDTOFromJson(
        Map<String, dynamic> json) =>
    DailyForecastDataDTO(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      moonrise: json['moonrise'] as int,
      moonSet: json['moonset'] as int,
      moonPhase: (json['moon_phase'] as num).toDouble(),
      temp: TemperatureDTO.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike:
          FeelsLikeDTO.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dew_point'] as num).toDouble(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDeg: json['wind_deg'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] as int,
      pop: (json['pop'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      rain: (json['rain'] as num?)?.toDouble(),
      snow: (json['snow'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DailyForecastDataDTOToJson(
        DailyForecastDataDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonSet,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
      'snow': instance.snow,
      'uvi': instance.uvi,
    };
