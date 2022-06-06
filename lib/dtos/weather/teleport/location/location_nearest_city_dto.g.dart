// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestCityDTO _$LocationNearestCityDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestCityDTO(
      links: LocationNearestCityLinksDTO.fromJson(
          json['_links'] as Map<String, dynamic>),
      distanceKm: (json['distance_km'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationNearestCityDTOToJson(
        LocationNearestCityDTO instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'distance_km': instance.distanceKm,
    };
