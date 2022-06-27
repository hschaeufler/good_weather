
import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDTO {
  LocationDTO({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}
