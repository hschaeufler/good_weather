import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

@JsonSerializable()
class TemperatureDTO {
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @JsonKey(name: "temp_min")
  final double? tempMin;
  @JsonKey(name: "temp_max")
  final double? tempMax;
  final int pressure;
  final int humidity;

  TemperatureDTO(
      {required this.temp,
      required this.feelsLike,
      this.tempMin,
      this.tempMax,
      required this.pressure,
      required this.humidity});

  factory TemperatureDTO.fromJson(Map<String, dynamic> json) => _$TemperatureDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureDTOToJson(this);
}
