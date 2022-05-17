// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feels_like_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeelsLikeDTO _$FeelsLikeDTOFromJson(Map<String, dynamic> json) => FeelsLikeDTO(
      day: (json['day'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
      eve: (json['eve'] as num).toDouble(),
      morn: (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$FeelsLikeDTOToJson(FeelsLikeDTO instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
