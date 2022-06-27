import 'package:good_weather/dtos/weather/places/place_id/adress_component_dto.dart';
import 'package:good_weather/dtos/weather/places/place_id/geometry_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class ResultDTO {
  ResultDTO({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.types,
  });


  @JsonKey(name: 'address_components')
  List<AddressComponentDTO> addressComponents;
  @JsonKey(name: 'formatted_address')
  String formattedAddress;
  GeometryDTO geometry;
  @JsonKey(name: 'place_id')
  String placeId;
  List<String> types;

  factory ResultDTO.fromJson(Map<String, dynamic> json) => _$ResultDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDTOToJson(this);
}