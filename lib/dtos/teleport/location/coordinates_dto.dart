import 'package:json_annotation/json_annotation.dart';

import 'latlon_dto.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable()
class CoordinatesDTO {
  CoordinatesDTO({
    required this.geohash,
    required this.latlon,
  });

  final String geohash;
  final LatlonDTO latlon;

  factory CoordinatesDTO.fromJson(Map<String, dynamic> json) => _$CoordinatesDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesDTOToJson(this);
}