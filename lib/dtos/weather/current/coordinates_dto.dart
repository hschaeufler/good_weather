import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable()
class CoordinatesDTO {
  final double lon;
  final double lat;

  CoordinatesDTO({required this.lon, required this.lat});

  factory CoordinatesDTO.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesDTOToJson(this);
}
