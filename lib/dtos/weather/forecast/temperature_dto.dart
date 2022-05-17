
import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

@JsonSerializable()
class TemperatureDTO {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TemperatureDTO(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});

  factory TemperatureDTO.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureDTOToJson(this);
}
