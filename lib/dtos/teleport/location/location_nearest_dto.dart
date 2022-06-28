
import 'package:json_annotation/json_annotation.dart';

part 'location_nearest_dto.g.dart';

@JsonSerializable()
class LocationNearestDTO {
  LocationNearestDTO({
    required this.href,
    required this.name,
  });

  final String href;
  final String name;

  factory LocationNearestDTO.fromJson(Map<String, dynamic> json) => _$LocationNearestDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationNearestDTOToJson(this);
}
