import 'package:json_annotation/json_annotation.dart';

import 'bounds_dto.dart';
import 'location_dto.dart';

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

  factory GeometryDTO.fromJson(Map<String, dynamic> json) =>
      _$GeometryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryDTOToJson(this);
}
