import 'package:json_annotation/json_annotation.dart';

import 'location_nearest_city_dto.dart';
import 'location_nearest_urban_area_dto.dart';


part 'embedded_dto.g.dart';

@JsonSerializable()
class EmbeddedDTO {
  EmbeddedDTO({
    required this.locationNearestCities,
    required this.locationNearestUrbanAreas,
  });

  @JsonKey(name: 'location:nearest-cities')
  List<LocationNearestCityDTO> locationNearestCities;
  @JsonKey(name: 'location:nearest-urban-areas')
  List<LocationNearestUrbanAreaDTO> locationNearestUrbanAreas;

  factory EmbeddedDTO.fromJson(Map<String, dynamic> json) => _$EmbeddedDTOFromJson(json);
  Map<String, dynamic> toJson() => _$EmbeddedDTOToJson(this);
}