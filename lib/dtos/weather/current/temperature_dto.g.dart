// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureDTO _$TemperatureDTOFromJson(Map<String, dynamic> json) =>
    TemperatureDTO(
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num).toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$TemperatureDTOToJson(TemperatureDTO instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
