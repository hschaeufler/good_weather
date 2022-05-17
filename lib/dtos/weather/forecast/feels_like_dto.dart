import 'package:json_annotation/json_annotation.dart';

part 'feels_like_dto.g.dart';

@JsonSerializable()
class FeelsLikeDTO {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeDTO(
      {required this.day,
      required this.night,
      required this.eve,
      required this.morn});

  factory FeelsLikeDTO.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeDTOFromJson(json);
  Map<String, dynamic> toJson() => _$FeelsLikeDTOToJson(this);
}
