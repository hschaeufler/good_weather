// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleport_urban_area_image_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeleportUrbanAreaImageDataDTO _$TeleportUrbanAreaImageDataDTOFromJson(
        Map<String, dynamic> json) =>
    TeleportUrbanAreaImageDataDTO(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeleportUrbanAreaImageDataDTOToJson(
        TeleportUrbanAreaImageDataDTO instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };
