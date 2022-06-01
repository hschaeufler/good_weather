import 'package:json_annotation/json_annotation.dart';

import 'location_nearest_city_links_dto.dart';

part 'location_nearest_city_dto.g.dart';

@JsonSerializable()
class LocationNearestCityDTO {
  LocationNearestCityDTO({
    required this.links,
    required this.distanceKm,
  });

  final LocationNearestCityLinksDTO links;
  final double distanceKm;

  factory LocationNearestCityDTO.fromJson(Map<String, dynamic> json) => _$LocationNearestCityDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationNearestCityDTOToJson(this);
}
