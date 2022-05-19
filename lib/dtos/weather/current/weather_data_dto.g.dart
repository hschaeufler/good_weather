// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataDTO _$WeatherDataDTOFromJson(Map<String, dynamic> json) =>
    WeatherDataDTO(
      coord: CoordinatesDTO.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: TemperatureDTO.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      wind: WindDTO.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: CloudDTO.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      sys: SystemDTO.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      cod: json['cod'] as int,
    );

Map<String, dynamic> _$WeatherDataDTOToJson(WeatherDataDTO instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
