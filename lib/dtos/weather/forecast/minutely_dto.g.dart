// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minutely_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinutelyDTO _$MinutelyDTOFromJson(Map<String, dynamic> json) => MinutelyDTO(
      dt: json['dt'] as int,
      precipitation: (json['precipitation'] as num).toDouble(),
    );

Map<String, dynamic> _$MinutelyDTOToJson(MinutelyDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation,
    };
