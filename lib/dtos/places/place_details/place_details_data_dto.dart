
import 'package:json_annotation/json_annotation.dart';

import 'result_dto.dart';

part 'place_details_data_dto.g.dart';

@JsonSerializable()
class PlaceDetailsDataDto {
  PlaceDetailsDataDto({
    required this.htmlAttributions,
    required this.result,
    required this.status,
  });

  @JsonKey(name: 'html_attributions')
  List<dynamic> htmlAttributions;
  ResultDTO result;
  String status;

  factory PlaceDetailsDataDto.fromJson(Map<String, dynamic> json) => _$PlaceDetailsDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDetailsDataDtoToJson(this);
}