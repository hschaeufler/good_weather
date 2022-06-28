// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_geocode_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapsGeocodeDataDto _$MapsGeocodeDataDtoFromJson(Map<String, dynamic> json) =>
    MapsGeocodeDataDto(
      plusCode: PlusCodeDTO.fromJson(json['plus_code'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$MapsGeocodeDataDtoToJson(MapsGeocodeDataDto instance) =>
    <String, dynamic>{
      'plus_code': instance.plusCode,
      'results': instance.results,
      'status': instance.status,
    };
