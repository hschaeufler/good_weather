import 'package:good_weather/dtos/weather/teleport/location/location_nearest_city_dto.dart';
import 'package:good_weather/dtos/weather/teleport/location/location_nearest_urban_area_dto.dart';
import 'package:json_annotation/json_annotation.dart';


part 'embedded_dto.g.dart';

@JsonSerializable()
class EmbeddedDTO {
  EmbeddedDTO({
    required this.locationNearestCities,
    required this.locationNearestUrbanAreas,
  });

  List<LocationNearestCityDTO> locationNearestCities;
  List<LocationNearestUrbanAreaDTO> locationNearestUrbanAreas;

  factory EmbeddedDTO.fromJson(Map<String, dynamic> json) => _$EmbeddedDTOFromJson(json);
  Map<String, dynamic> toJson() => _$EmbeddedDTOToJson(this);
}