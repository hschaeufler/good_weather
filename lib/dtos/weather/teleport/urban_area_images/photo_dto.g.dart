// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDTO _$PhotoDTOFromJson(Map<String, dynamic> json) => PhotoDTO(
      attribution:
          AttributionDTO.fromJson(json['attribution'] as Map<String, dynamic>),
      image: ImageDTO.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoDTOToJson(PhotoDTO instance) => <String, dynamic>{
      'attribution': instance.attribution,
      'image': instance.image,
    };
