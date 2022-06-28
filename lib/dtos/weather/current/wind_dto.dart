import 'package:json_annotation/json_annotation.dart';

part 'wind_dto.g.dart';

@JsonSerializable()
class WindDTO {
  final double speed;
  final int deg;

  WindDTO({required this.speed, required this.deg});

  factory WindDTO.fromJson(Map<String, dynamic> json) =>
      _$WindDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WindDTOToJson(this);
}
