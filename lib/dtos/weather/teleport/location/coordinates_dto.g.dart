// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesDTO _$CoordinatesDTOFromJson(Map<String, dynamic> json) =>
    CoordinatesDTO(
      geohash: json['geohash'] as String,
      latlon: LatlonDTO.fromJson(json['latlon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoordinatesDTOToJson(CoordinatesDTO instance) =>
    <String, dynamic>{
      'geohash': instance.geohash,
      'latlon': instance.latlon,
    };
