// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_urban_area_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestUrbanAreaDTO _$LocationNearestUrbanAreaDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestUrbanAreaDTO(
      links: LocationNearestUrbanAreaLinksDTO.fromJson(
          json['links'] as Map<String, dynamic>),
      distanceKm: json['distanceKm'] as int,
    );

Map<String, dynamic> _$LocationNearestUrbanAreaDTOToJson(
        LocationNearestUrbanAreaDTO instance) =>
    <String, dynamic>{
      'links': instance.links,
      'distanceKm': instance.distanceKm,
    };
