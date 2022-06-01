import 'package:json_annotation/json_annotation.dart';

import 'location_nearest_urban_area_links_dto.dart';

part 'location_nearest_urban_area_dto.g.dart';

@JsonSerializable()
class LocationNearestUrbanAreaDTO {
  LocationNearestUrbanAreaDTO({
    required this.links,
    required this.distanceKm,
  });

  final LocationNearestUrbanAreaLinksDTO links;
  final int distanceKm;

  factory LocationNearestUrbanAreaDTO.fromJson(Map<String, dynamic> json) => _$LocationNearestUrbanAreaDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationNearestUrbanAreaDTOToJson(this);
}