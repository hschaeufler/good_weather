// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_urban_area_links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestUrbanAreaLinksDTO _$LocationNearestUrbanAreaLinksDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestUrbanAreaLinksDTO(
      locationNearestUrbanArea: LocationNearestDTO.fromJson(
          json['location:nearest-urban-area'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationNearestUrbanAreaLinksDTOToJson(
        LocationNearestUrbanAreaLinksDTO instance) =>
    <String, dynamic>{
      'location:nearest-urban-area': instance.locationNearestUrbanArea,
    };
