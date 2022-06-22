// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribution_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributionDTO _$AttributionDTOFromJson(Map<String, dynamic> json) =>
    AttributionDTO(
      license: json['license'] as String,
      photographer: json['photographer'] as String,
      site: json['site'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$AttributionDTOToJson(AttributionDTO instance) =>
    <String, dynamic>{
      'license': instance.license,
      'photographer': instance.photographer,
      'site': instance.site,
      'source': instance.source,
    };
