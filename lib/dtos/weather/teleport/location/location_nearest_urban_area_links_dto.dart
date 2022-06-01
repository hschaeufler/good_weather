import 'package:json_annotation/json_annotation.dart';

import 'location_nearest_dto.dart';

part 'location_nearest_urban_area_links_dto.g.dart';

@JsonSerializable()
class LocationNearestUrbanAreaLinksDTO {
  LocationNearestUrbanAreaLinksDTO({
    required this.locationNearestUrbanArea,
  });

  final LocationNearestDTO locationNearestUrbanArea;

  factory LocationNearestUrbanAreaLinksDTO.fromJson(Map<String, dynamic> json) => _$LocationNearestUrbanAreaLinksDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationNearestUrbanAreaLinksDTOToJson(this);
}
