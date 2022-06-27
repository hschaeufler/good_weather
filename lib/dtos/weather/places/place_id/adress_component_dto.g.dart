// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adress_component_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponentDTO _$AddressComponentDTOFromJson(Map<String, dynamic> json) =>
    AddressComponentDTO(
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddressComponentDTOToJson(
        AddressComponentDTO instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
