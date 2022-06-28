
import 'package:json_annotation/json_annotation.dart';

part 'latlon_dto.g.dart';

@JsonSerializable()
class LatlonDTO {
  LatlonDTO({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory LatlonDTO.fromJson(Map<String, dynamic> json) => _$LatlonDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LatlonDTOToJson(this);
}