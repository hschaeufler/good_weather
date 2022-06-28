// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoundsDTO _$BoundsDTOFromJson(Map<String, dynamic> json) => BoundsDTO(
      northeast:
          LocationDTO.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest:
          LocationDTO.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundsDTOToJson(BoundsDTO instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };
