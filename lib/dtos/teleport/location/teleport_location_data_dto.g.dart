// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleport_location_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeleportLocationDataDTO _$TeleportLocationDataDTOFromJson(
        Map<String, dynamic> json) =>
    TeleportLocationDataDTO(
      embedded: EmbeddedDTO.fromJson(json['_embedded'] as Map<String, dynamic>),
      coordinates:
          CoordinatesDTO.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeleportLocationDataDTOToJson(
        TeleportLocationDataDTO instance) =>
    <String, dynamic>{
      '_embedded': instance.embedded,
      'coordinates': instance.coordinates,
    };
