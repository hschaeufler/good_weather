import 'package:good_weather/dtos/weather/places/place_id/plus_code_dto.dart';
import 'package:good_weather/dtos/weather/places/place_id/result_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maps_geocode_data_dto.g.dart';

@JsonSerializable()
class MapsGeocodeDataDto {
  @JsonKey(name: 'plus_code')
  PlusCodeDTO plusCode;
  List<ResultDTO> results;
  String status;

  MapsGeocodeDataDto(
      {required this.plusCode, required this.results, required this.status});

  factory MapsGeocodeDataDto.fromJson(Map<String, dynamic> json) => _$MapsGeocodeDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MapsGeocodeDataDtoToJson(this);
}
