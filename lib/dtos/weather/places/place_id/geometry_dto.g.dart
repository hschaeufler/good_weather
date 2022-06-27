// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeometryDTO _$GeometryDTOFromJson(Map<String, dynamic> json) => GeometryDTO(
      bounds: BoundsDTO.fromJson(json['bounds'] as Map<String, dynamic>),
      location: LocationDTO.fromJson(json['location'] as Map<String, dynamic>),
      locationType: json['location_type'] as String,
      viewport: BoundsDTO.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryDTOToJson(GeometryDTO instance) =>
    <String, dynamic>{
      'bounds': instance.bounds,
      'location': instance.location,
      'location_type': instance.locationType,
      'viewport': instance.viewport,
    };
