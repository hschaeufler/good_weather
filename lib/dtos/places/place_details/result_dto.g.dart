// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDTO _$ResultDTOFromJson(Map<String, dynamic> json) => ResultDTO(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultDTOToJson(ResultDTO instance) => <String, dynamic>{
      'photos': instance.photos,
    };
