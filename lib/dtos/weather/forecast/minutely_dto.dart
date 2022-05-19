
import 'package:json_annotation/json_annotation.dart';

part 'minutely_dto.g.dart';

@JsonSerializable()
class MinutelyDTO {
  final int dt;
  final double precipitation;

  MinutelyDTO({required this.dt, required this.precipitation});

  factory MinutelyDTO.fromJson(Map<String, dynamic> json) =>
      _$MinutelyDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MinutelyDTOToJson(this);
}
