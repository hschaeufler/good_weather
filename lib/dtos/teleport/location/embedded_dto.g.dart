// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbeddedDTO _$EmbeddedDTOFromJson(Map<String, dynamic> json) => EmbeddedDTO(
      locationNearestCities: (json['location:nearest-cities'] as List<dynamic>)
          .map(
              (e) => LocationNearestCityDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationNearestUrbanAreas: (json['location:nearest-urban-areas']
              as List<dynamic>)
          .map((e) =>
              LocationNearestUrbanAreaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmbeddedDTOToJson(EmbeddedDTO instance) =>
    <String, dynamic>{
      'location:nearest-cities': instance.locationNearestCities,
      'location:nearest-urban-areas': instance.locationNearestUrbanAreas,
    };
