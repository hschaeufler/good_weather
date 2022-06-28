// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsDataDto _$PlaceDetailsDataDtoFromJson(Map<String, dynamic> json) =>
    PlaceDetailsDataDto(
      htmlAttributions: json['html_attributions'] as List<dynamic>,
      result: ResultDTO.fromJson(json['result'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$PlaceDetailsDataDtoToJson(
        PlaceDetailsDataDto instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'result': instance.result,
      'status': instance.status,
    };
