// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDTO _$ResultDTOFromJson(Map<String, dynamic> json) => ResultDTO(
      addressComponents: (json['address_components'] as List<dynamic>)
          .map((e) => AddressComponentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formatted_address'] as String,
      geometry: GeometryDTO.fromJson(json['geometry'] as Map<String, dynamic>),
      placeId: json['place_id'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ResultDTOToJson(ResultDTO instance) => <String, dynamic>{
      'address_components': instance.addressComponents,
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry,
      'place_id': instance.placeId,
      'types': instance.types,
    };
