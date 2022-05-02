// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDTO _$CityDTOFromJson(Map<String, dynamic> json) => CityDTO(
      name: json['name'] as String,
      local_names: (json['local_names'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$CityDTOToJson(CityDTO instance) => <String, dynamic>{
      'name': instance.name,
      'local_names': instance.local_names,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
