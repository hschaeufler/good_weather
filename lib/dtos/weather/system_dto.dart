
import 'package:json_annotation/json_annotation.dart';

part 'system_dto.g.dart';

@JsonSerializable()
class SystemDTO {
  final int type;
  final int id;
  final double message;
  final String country;
  final int sunrise;
  final int sunset;

  SystemDTO({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset});

  factory SystemDTO.fromJson(Map<String, dynamic> json) => _$SystemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SystemDTOToJson(this);
}