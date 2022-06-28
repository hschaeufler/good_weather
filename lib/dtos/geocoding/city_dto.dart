import 'package:json_annotation/json_annotation.dart';

part 'city_dto.g.dart';

@JsonSerializable()
class CityDTO {
  final String name;
  @JsonKey(name: "local_names")
  final Map<String, String>? localNames;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  CityDTO(
      {required this.name,
      this.localNames,
      required this.lat,
      required this.lon,
      required this.country,
      this.state});

  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CityDTOToJson(this);
}
