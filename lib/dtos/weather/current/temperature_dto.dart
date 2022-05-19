import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

@JsonSerializable()
class TemperatureDTO {
  final double temp;
  final double feels_like;
  final double? temp_min;
  final double? temp_max;
  final int pressure;
  final int humidity;

  TemperatureDTO(
      {required this.temp,
      required this.feels_like,
      this.temp_min,
      this.temp_max,
      required this.pressure,
      required this.humidity});

  factory TemperatureDTO.fromJson(Map<String, dynamic> json) => _$TemperatureDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureDTOToJson(this);
}
