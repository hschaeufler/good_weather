// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_nearest_city_links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationNearestCityLinksDTO _$LocationNearestCityLinksDTOFromJson(
        Map<String, dynamic> json) =>
    LocationNearestCityLinksDTO(
      locationNearestCity: LocationNearestDTO.fromJson(
          json['location:nearest-city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationNearestCityLinksDTOToJson(
        LocationNearestCityLinksDTO instance) =>
    <String, dynamic>{
      'location:nearest-city': instance.locationNearestCity,
    };
