// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestCityDTO _$LocationNearestCityDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestCityDTO(
      links: LocationNearestCityLinksDTO.fromJson(
          json['links'] as Map<String, dynamic>),
      distanceKm: (json['distanceKm'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationNearestCityDTOToJson(
        LocationNearestCityDTO instance) =>
    <String, dynamic>{
      'links': instance.links,
      'distanceKm': instance.distanceKm,
    };
