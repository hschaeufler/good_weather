
import 'package:json_annotation/json_annotation.dart';

part 'attribution_dto.g.dart';

@JsonSerializable()
class AttributionDTO {
  AttributionDTO({
    required this.license,
    required this.photographer,
    required this.site,
    required this.source,
  });

  final String license;
  final String photographer;
  final String site;
  final String source;

  factory AttributionDTO.fromJson(Map<String, dynamic> json) => _$AttributionDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AttributionDTOToJson(this);
}
