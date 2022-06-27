import 'package:good_weather/dtos/weather/places/place_id/bounds_dto.dart';
import 'package:good_weather/dtos/weather/places/place_id/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geometry_dto.g.dart';

@JsonSerializable()
class GeometryDTO {
  GeometryDTO({
    required this.bounds,
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  BoundsDTO bounds;
  LocationDTO location;
  @JsonKey(name: 'location_type')
  String locationType;
  BoundsDTO viewport;

  factory GeometryDTO.fromJson(Map<String, dynamic> json) => _$GeometryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryDTOToJson(this);
}