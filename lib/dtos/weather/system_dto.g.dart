// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemDTO _$SystemDTOFromJson(Map<String, dynamic> json) => SystemDTO(
      type: json['type'] as int,
      id: json['id'] as int,
      message: (json['message'] as num?)?.toDouble(),
      country: json['country'] as String,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );

Map<String, dynamic> _$SystemDTOToJson(SystemDTO instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'message': instance.message,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
