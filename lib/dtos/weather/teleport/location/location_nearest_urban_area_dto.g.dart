// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_urban_area_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestUrbanAreaDTO _$LocationNearestUrbanAreaDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestUrbanAreaDTO(
      links: LocationNearestUrbanAreaLinksDTO.fromJson(
          json['_links'] as Map<String, dynamic>),
      distanceKm: (json['distance_km'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationNearestUrbanAreaDTOToJson(
        LocationNearestUrbanAreaDTO instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'distance_km': instance.distanceKm,
    };
