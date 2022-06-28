import 'package:json_annotation/json_annotation.dart';

import 'location_nearest_dto.dart';

part 'location_nearest_city_links_dto.g.dart';


@JsonSerializable()
class LocationNearestCityLinksDTO {
  LocationNearestCityLinksDTO({
    required this.locationNearestCity,
  });

  @JsonKey(name: 'location:nearest-city')
  final LocationNearestDTO locationNearestCity;

  factory LocationNearestCityLinksDTO.fromJson(Map<String, dynamic> json) => _$LocationNearestCityLinksDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationNearestCityLinksDTOToJson(this);
}