// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertDTO _$AlertDTOFromJson(Map<String, dynamic> json) => AlertDTO(
      sender_name: json['sender_name'] as String,
      event: json['event'] as String,
      start: json['start'] as int,
      end: json['end'] as int,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AlertDTOToJson(AlertDTO instance) => <String, dynamic>{
      'sender_name': instance.sender_name,
      'event': instance.event,
      'start': instance.start,
      'end': instance.end,
      'description': instance.description,
      'tags': instance.tags,
    };
