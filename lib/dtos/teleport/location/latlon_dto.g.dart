// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatlonDTO _$LatlonDTOFromJson(Map<String, dynamic> json) => LatlonDTO(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LatlonDTOToJson(LatlonDTO instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
